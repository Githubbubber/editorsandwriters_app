class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :avatar
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :alter_ego
      t.string :password_digest
      t.string :location
      t.string :title
      t.string :education
      t.string :haiku
      t.string :fav_style_manual
      t.string :fav_rule
      t.string :acct_type

      t.timestamps null: false
    end
    add_index :members, :email, unique: true
    add_index :members, :alter_ego, unique: true
  end
end
