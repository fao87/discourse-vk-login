# name: vk.com
# about: Authenticate with discourse with vk.com, see more at: https://vk.com/developers.php?id=-1_37230422&s=1
# version 0.2.0
# author: Sam Saffron, stereobooster

gem 'omniauth-vkontakte', '1.3.6'

class Auth::VkAuthenticator < ::Auth::Authenticator

  def name
    'vkontakte'
  end

  def after_authenticate(auth_token)

    result = Auth::Result.new

    session_info = parse_auth_token(auth_token)
    vkontakte_hash = session_info[:vkontakte]

    result.email = email = session_info[:email]
    result.email_valid = !email.blank?
    result.name = vkontakte_hash[:name]

    result.extra_data = vkontakte_hash

    user_info = VkontakteUserInfo.find_by(vkontakte_user_id: vkontakte_hash[:vkontakte_user_id])
    result.user = user_info.try(:user)

    if !result.user && !email.blank? && result.user = User.find_by_email(email)
     VkontakteUserInfo.create({user_id: result.user.id}.merge(vkontakte_hash))
    end

    if email.blank?
     UserHistory.create(
       action: UserHistory.actions[:vkontakte_no_email],
       details: "name: #{vkontakte_hash[:name]}, vkontakte_user_id: #{vkontakte_hash[:vkontakte_user_id]}"
     )
    end

    result
  end

  def after_create_account(user, auth)
   data = auth[:extra_data]
   VkontakteUserInfo.create({user_id: user.id}.merge(data))
  end

  # def after_create_account(user, auth)
  #   data = auth[:extra_data]
  #   ::PluginStore.set("vk", "vk_uid_#{data[:vkontakte_user_id]}", {user_id: user.id })
  # end

  def register_middleware(omniauth)
    omniauth.provider :vkontakte,
           :setup => lambda { |env|
              strategy = env["omniauth.strategy"]
              strategy.options[:client_id] = SiteSetting.vk_client_id
              strategy.options[:client_secret] = SiteSetting.vk_client_secret
           },
           :scope => "email"
  end

  protected

    def parse_auth_token(auth_token)

      raw_info = auth_token["extra"]["raw_info"]
      email = auth_token["info"][:email] || auth_token["info"]["email"]

      # https://github.com/mamantoha/omniauth-vkontakte#authentication-hash

      {
        vkontakte: {
          vkontakte_user_id: auth_token["uid"],
          link: raw_info["link"],
          username: raw_info["nickname"],
          first_name: raw_info["first_name"],
          last_name: raw_info["last_name"],
          email: email,
          gender: raw_info["sex"],
          name: raw_info["screen_name"]
        },
        email: email,
        email_valid: true
      }

    end

end


auth_provider :frame_width => 920,
              :frame_height => 800,
              :authenticator => Auth::VkAuthenticator.new

# for icon vk we use https://github.com/raulghm/Font-Awesome-Stylus/blob/master/stylus/variables.styl

register_css <<CSS

.btn-social.vkontakte {
  background: #46698f;
}

.btn-social.vkontakte:before {
  content: $fa-var-vk;
}

CSS
