# name: vk.com
# about: Authenticate with discourse with vk.com, see more at: https://vk.com/developers.php?id=-1_37230422&s=1
# version 0.2.2
# author: Sam Saffron, stereobooster

gem 'omniauth-vkontakte', '1.3.6'

# load the engine
load File.expand_path('../lib/vk.rb', __FILE__)

auth_provider :frame_width => 920,
              :frame_height => 800,
              :authenticator => Vk::Authenticator.new

register_asset "stylesheets/vk_styles.scss"
