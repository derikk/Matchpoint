class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show edit update destroy set_active]

  @@active_survey = nil

  # GET /survey
  def active
    @survey = @@active_survey
  end

  # POST /admin/surveys/1/active
  def set_active
    @@active_survey = @survey
    redirect_to active_survey_url
  end

  # GET /admin/surveys
  def index
    @surveys = Survey.all
  end

  # GET /admin/surveys/1
  def show; end

  # GET /admin/surveys/new
  def new
    @survey = Survey.new
    15.times { @survey.questions.build }
  end

  # GET /admin/surveys/1/edit
  def edit; end

  # POST /admin/surveys
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: "Survey was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/surveys/1
  def update
    if @survey.update(survey_params)
      redirect_to @survey, flash: { success: "Survey saved." }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/surveys/1
  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: "Survey deleted."
    # redirect_to surveys_url, flash: { success: "Survey deleted." }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:title, questions_attributes: [:id, :position, :question, answers: []])
    end
end
