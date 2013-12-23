class AddAuthorIpToPost < ActiveRecord::Migration
  def change
    add_column :posts, :author_ip, :string
  end
end
