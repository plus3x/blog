class Post < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  belongs_to :category, touch: true
  has_one :author
  accepts_nested_attributes_for :author
end
