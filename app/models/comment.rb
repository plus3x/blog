class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :author
  accepts_nested_attributes_for :author
  
  after_validation on: :create do
    self.post.rating = post.comments.map(&:rating).sum.to_f / post.comments.count
    self.post.save
  end
  
  validates_length_of :rating, in: 1..5 
end
