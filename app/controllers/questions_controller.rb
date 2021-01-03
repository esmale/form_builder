class QuestionsController < ApplicationController

  def new
    @question = Question.new new_question_params
    render turbo_stream: turbo_stream.update(:question_form, partial: 'questions/new' )
  end

  def create
    @question = Question.new question_params
    if @question.valid?
      render turbo_stream: [
        turbo_stream.update(:question_form, partial: 'questions/select_type' ),
        turbo_stream.append(:form_questions, partial: "questions/question"),
      ]
    else
      render turbo_stream: turbo_stream.update(:question_form, partial: "questions/new")
    end
  end

  protected

  def new_question_params
    params.require(:question).permit(:question_type, :form_id)
  end

  def question_params
    params.require(:question).permit(:question_type, :form_id, :label,
      answers_attributes: [:label, :_destroy]
    )
  end

end
