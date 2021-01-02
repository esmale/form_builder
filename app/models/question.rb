class Question < ApplicationRecord
  belongs_to :form, optional: true
  has_many :answers

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  validates :label, presence: true
  validate :answers_validation

  def answers_validation
    if QuestionType.has_options?(self) && answers.length < 2
      errors.add(:base, "Must have at least 2 possible answers")
    end
  end

end
