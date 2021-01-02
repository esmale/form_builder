class Question < ApplicationRecord
  belongs_to :form
  has_many :answers

  def has_options?
    ["radio", "select", "checkbox_group"].include?(question_type)
  end
end
