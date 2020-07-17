class ProfilesController < ApplicationController
  before_action :require_user_logged_in
  
  def show
   @profile = current_user.profile
  end
    
  def new
    @profile = current_user.build_profile
  end
  
  def create
  @profile = current_user.build_profile(profile_params)
     if @profile.save
       redirect_to profile_path
     else
       render :new
     end
  end

  
  def edit
    @profile = current_user.prepare_profile
  end
  
  def update
     @profile = current_user.prepare_profile
     @profile.assign_attributes(profile_params)
     if @profile.save
       redirect_to profile_path
     else
       render :edit
     end
  end
  
   
  private
      def profile_params
         params.require(:profile).permit(:nickname, :introduction)
      end
end
