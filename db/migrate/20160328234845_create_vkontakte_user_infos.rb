class CreateVkontakteUserInfos < ActiveRecord::Migration
  def change
    create_table :vkontakte_user_infos do |t|
      t.integer :user_id, null: false
      t.integer :vkontakte_user_id, limit: 8, null: false
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :vkontakte_user_infos, :user_id, unique: true
    add_index :vkontakte_user_infos, :vkontakte_user_id, unique: true
  end
end
