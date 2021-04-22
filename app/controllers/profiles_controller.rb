class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]
  # before_action :set_profile, only: %i[show edit update]

  # GET /profile/new
  def new
    @profile = Profile.new
    @profile.name = current_user.name
  end

  # POST /profile
  def create
    @profile = current_user.create_profile(profile_params)
    if @profile.save
      redirect_to profile_url, flash: {success: "Profile saved."} # Should it go to the survey instead?
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profile
  def update
    if @profile.update(profile_params)
      redirect_to profile_url, flash: {success: "Profile saved."}
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def set_profile
      @profile = current_user.profile || (redirect_to new_profile_url)
    end  
  
    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :grade, :gender, :likes_women, :likes_men, :likes_nonbinary, :bio, :photo)
    end
end
