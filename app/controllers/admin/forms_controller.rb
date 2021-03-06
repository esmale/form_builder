class Admin::FormsController < ApplicationController

  def index
    @forms = current_user.forms.order("name ASC")
  end

  def new
    @form = Form.new
  end

  def create
    @form = current_user.forms.build form_params
    if @form.save
      redirect_to admin_forms_path, notice: "Form created"
    else
      render :new
    end
  end

  def edit
    @form = current_user.forms.find params[:id]
    redirect_if_published
  end

  def update
    @form = current_user.forms.find params[:id]
    redirect_if_published
    if @form.update(form_params)
      redirect_to admin_forms_path, notice: "Form updated"
    else
      render :edit
    end
  end

  protected

  def form_params
    params.require(:form).permit(:name, :published,
      questions_attributes: [:id, :question_type, :label, :_destroy,
        answers_attributes: [:id, :label],
      ]
    )
  end

  def redirect_if_published
    redirect_to admin_forms_path, alert: "This form is already published, and cannot be further edited." if @form.published?
  end
end
