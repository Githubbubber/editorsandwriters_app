class AddAboutmeColumnToMembers < ActiveRecord::Migration
  def change
    add_column :members, :aboutme, :text
  end
end
