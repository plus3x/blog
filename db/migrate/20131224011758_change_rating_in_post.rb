class ChangeRatingInPost < ActiveRecord::Migration
  def change
    remove_column :posts, :rating
    add_column :posts, :rating, :decimal, precision: 8, scale: 2
  end
end
