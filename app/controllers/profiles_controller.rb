class ProfilesController < ApplicationController
  before_action :authenticate_user!, :set_profile

  # GET /profile
  def show
    if @profile.invalid?
      redirect_to edit_profile_url
    end
  end

  # GET /profile/edit
  def edit
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
      @profile = current_user.profile
    end  
  
    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :grade, :gender, :likes_women, :likes_men, :likes_nonbinary, :bio, :photo)
    end
end
