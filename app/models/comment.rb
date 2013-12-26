class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :author
  accepts_nested_attributes_for :author
  
  after_validation on: :create do
    if post.rating
      self.post.rating = (post.rating * post.comments.count + rating) / (post.comments.count + 1)
    else
      self.post.rating = rating
    end
    self.post.save
  end
  
  validates_length_of :rating, in: 1..5 
end
