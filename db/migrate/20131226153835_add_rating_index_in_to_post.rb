class AddRatingIndexInToPost < ActiveRecord::Migration
  def change
    add_index :posts, :rating
  end
end
