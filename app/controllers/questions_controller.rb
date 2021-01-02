class QuestionsController < ApplicationController

  def new
    @question = Question.new new_question_params
    render turbo_stream: turbo_stream.update(:question_form, partial: 'questions/new' )
  end

  def create
    @question = Question.new question_params
    render turbo_stream: [
      turbo_stream.update(:question_form, partial: 'questions/select_type' ),
      turbo_stream.append(:form_questions, partial: "question_types/question_type"),
    ]
  end

  protected

  def new_question_params
    params.require(:question).permit(:question_type, :form_id)
  end

  def question_params
    params.require(:question).permit(:question_type, :form_id, :label)
  end

end
