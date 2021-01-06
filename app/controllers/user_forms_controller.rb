class UserFormsController < ApplicationController
  before_action :load_form_and_questions

  def new
    @user_form = UserForm.new
  end

  def create
    @user_form = UserForm.new user_form_params
    @user_form.form = @form
    @user_form.user = current_user
    if @user_form.save
      redirect_to root_path, notice: "Your form response has been recorded"
    else
      render :new
    end
  end

  protected

  def load_form_and_questions
    @form = Form.published.find params[:form_id]
    @questions = @form.questions.order("created_at ASC").includes(:answers)
  end

  def user_form_params
    params.require(:user_form).permit(
      form_answers_attributes: [:question_id, :answer, :answer_id])
  end
end
