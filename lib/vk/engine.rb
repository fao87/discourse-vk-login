module Vk
  class Engine < ::Rails::Engine
    isolate_namespace Vk

    # config.after_initialize do
    # end

    config.to_prepare do
      # inject our dependencies
      # runs once in production, before every request in development
      # User.class_eval { has_one :vkontakte_user_info, dependent: :destroy }
      User.send(:include, Vk::VkExtender)
    end
  end
end
