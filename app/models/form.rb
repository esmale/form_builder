class Form < ApplicationRecord
  belongs_to :user
  has_many :questions
  accepts_nested_attributes_for :questions
end
