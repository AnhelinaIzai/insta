class ProfilesController < ApplicationController
	def new
    @profile = Profile.new
  end
  
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profiles_path(@profile.id)
    end
    
  end
  
  def show
    @profile = current_user.profile
  end
  
  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(profile_params)
       redirect_to profiles_path(@profile.id)
    end
    
  end
  
private

  def profile_params
    params.require(:profile).permit(:user_id, :nickname, :age, :avatar)
  end
end
