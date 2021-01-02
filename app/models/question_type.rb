class QuestionType

  TYPES = [
    { name: "Checkbox", value: "checkbox", options: false },
    { name: "Date", value: "date", options: false },
    { name: "Radio", value: "radio", options: true },
    { name: "Select", value: "select", options: true },
    { name: "Text Field", value: "text", options: false },
    { name: "Textarea", value: "textarea", options: false },
  ]

  def self.has_options?(question)
    TYPES.find{ |type| type[:value] == question.question_type }[:options]
  end
end
