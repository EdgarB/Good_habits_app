class ActivitiesController < ApplicationController
    before_action :authenticate_user!, except: [:index]

  def index
      if(user_signed_in?)
          @user_email = current_user.email
          @activities_from_user = get_activities_from current_user.id
      end
  end

  def new
      @activity = Activity.new
  end

  def create
      act_to_save = Activity.new
      act_to_save.name = params["activity"]["name"]
      act_to_save.description = params["activity"]["description"]
      act_to_save.frequency = params["activity"]["frequency"]
      act_to_save.user = User.find(current_user.id)
      if(act_to_save.save)

          redirect_to root_path, notice: "New habit saved succesfully."

          #current_user.activities << act_to_save
          #current_user.save
      else
          redirect_to new_activity_path, alert: "Couldn't save your new habit, please fill all the neccesary fields."
      end

  end

  private
  def get_activities_from (user_id)
      User.find(user_id).activities
  end

end
