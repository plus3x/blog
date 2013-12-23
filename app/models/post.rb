class Post < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  belongs_to :category, touch: true
end
