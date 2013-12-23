class RemoveAuthorIpFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :author_ip
  end
end
