class UserForm < ApplicationRecord
  belongs_to :form
  belongs_to :user
  has_many :form_answers

  accepts_nested_attributes_for :form_answers, reject_if: :all_blank, allow_destroy: true
end
