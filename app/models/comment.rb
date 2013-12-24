class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :author
  accepts_nested_attributes_for :author
end
