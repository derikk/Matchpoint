class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_profile, only: [:show, :edit, :update]

  def new
    @profile = Profile.new
    @profile.name = current_user.name
  end

  def create
    @profile = current_user.create_profile(profile_params)
    if @profile.save
      redirect_to profile_path, flash: {success: "Profile saved."} # Should it go to the survey instead?
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, flash: {success: "Profile saved."}
    else
      render :edit
    end
  end


  private
    def profile_params
      params.require(:profile).permit(:name, :grade, :gender, :likes_women, :likes_men, :likes_nonbinary, :bio, :photo)
    end

    def get_profile
      @profile = current_user.profile || (redirect_to new_profile_path)
    end
end
