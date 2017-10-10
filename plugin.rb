# name: discourse-vk-login
# about: Authenticate with discourse with vk.com, see more at: https://vk.com/developers.php?id=-1_37230422&s=1
# version: 0.2.4
# author: Sam Saffron, stereobooster
# url: https://github.com/stereobooster/discourse-vk-login

enabled_site_setting :vk_client_id
enabled_site_setting :vk_client_secret

gem 'omniauth-vkontakte', '1.3.6'

# load the engine
load File.expand_path('../lib/vk.rb', __FILE__)

auth_provider :frame_width => 920,
              :frame_height => 800,
              :authenticator => Vk::Authenticator.new

register_asset "stylesheets/vk_styles.scss"
