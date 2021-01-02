class FormsController < ApplicationController

  def index
    @forms = current_user.forms.order("name ASC")
  end

  def new
    @form = Form.new
  end

  def create
    @form = current_user.forms.build form_params
    if @form.save
      redirect_to forms_path, notice: "Form created"
    else
      render :new
    end
  end

  def edit
    @form = current_user.forms.find param[:id]
    redirect_if_published
  end

  def update
    @form = current_user.forms.find param[:id]
    redirect_if_published
    if @form.update(form_params)
      redirect_to forms_path, notice: "Form updated"
    else
      render :edit
    end
  end

  protected

  def form_params
    params.require(:form).permit(:name, :published)
  end

  def redirect_if_published
    redirect_to forms_path, alert: "This form is already published, and cannot be further edited." if @form.published?
  end
end
