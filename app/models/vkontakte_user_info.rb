class VkontakteUserInfo < ActiveRecord::Base
  belongs_to :user
end

User.class_eval { has_one :vkontakte_user_info, dependent: :destroy }

# == Schema Information
#
# Table name: vkontakte_user_infos
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  vkontakte_user_id :integer          not null
#  username          :string
#  first_name        :string
#  last_name         :string
#  email             :string
#  gender            :string
#  name              :string
#  link              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_vkontakte_user_infos_on_vkontakte_user_id  (vkontakte_user_id) UNIQUE
#  index_vkontakte_user_infos_on_user_id            (user_id) UNIQUE
#
