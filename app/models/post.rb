class Post < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  belongs_to :category, touch: true
  belongs_to :author
  accepts_nested_attributes_for :author
  
  after_validation on: :create do
    self.rating ||= 1
  end
end
