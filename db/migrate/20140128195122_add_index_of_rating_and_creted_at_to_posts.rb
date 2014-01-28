class AddIndexOfRatingAndCretedAtToPosts < ActiveRecord::Migration
  def change
    add_index :posts, [:rating, :created_at]
  end
end
