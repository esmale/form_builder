class Form < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :user_forms
  
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  scope :published, ->{ where(published: true) }
end
