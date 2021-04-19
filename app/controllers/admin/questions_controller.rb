class Admin::QuestionsController < ApplicationController

  def new
    @question = Question.new new_question_params
    if @question.question_type.present?
      render turbo_stream: turbo_stream.update(:question_form, partial: 'admin/questions/question_form' )
    else
      render turbo_stream: turbo_stream.update(:question_panel, partial: 'admin/questions/new' )
    end
  end

  def create
    @question = Question.new question_params
    if @question.valid?
      render turbo_stream: [
        turbo_stream.update(:question_form, partial: 'admin/questions/select_type' ),
        turbo_stream.append(:form_questions, partial: 'admin/questions/question'),
      ]
    else
      render turbo_stream: turbo_stream.update(:question_form, partial: 'admin/questions/new')
    end
  end

  def edit
    @question = Question.find params[:id]
    render turbo_stream: turbo_stream.update(:question_panel, partial: 'admin/questions/edit' )
  end

  def update
    @question = Question.find(params[:id])
    @question.assign_attributes question_params
    if @question.valid?
      target = "question-#{@question.id}".to_sym
      render turbo_stream: turbo_stream.replace(target, partial: 'admin/questions/question' )
    else
      render turbo_stream: turbo_stream.update(:question_panel, partial: 'admin/questions/edit' )
    end
  end

  protected

  def new_question_params
    params.require(:question).permit(:question_type, :form_id)
  end

  def question_params
    params.require(:question).permit(:question_type, :form_id, :label,
      answers_attributes: [:id, :label, :_destroy]
    )
  end

end
