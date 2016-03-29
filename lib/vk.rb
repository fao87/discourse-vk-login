require File.expand_path('../vk/engine', __FILE__)

module Vk
  module VkExtender
    def self.included(klass)
      klass.has_one :vkontakte_user_info, dependent: :destroy, class_name: "::VkontakteUserInfo"
    end
  end
end
