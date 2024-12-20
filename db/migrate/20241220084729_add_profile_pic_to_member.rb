class AddProfilePicToMember < ActiveRecord::Migration[8.0]
  def change
    add_column :members, :profile_pic, :string
  end
end
