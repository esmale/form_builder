class Admin::ResponsesController < ApplicationController
  before_action :load_form

  def index
    @user_forms = UserForm.joins(:user).includes(:user).
                           where(form_id: @form.id).
                           order("users.last_name ASC, users.first_name ASC")
  end

  def show
    @user_form = @form.user_forms.find params[:id]
  end

  protected

  def load_form
    @form = current_user.forms.find params[:form_id]
  end
end
