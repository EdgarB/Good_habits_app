class LogsController < ApplicationController
    before_action :authenticate_user!
    def index
        current_act = Activity.find(params[:activity_id]);
        if(current_act)
            @act_name = current_act.name
            @logs = current_act.logs
        else
            redirect_to root_path, alert: "That habit doesn't exist"
        end
    end

    def new
      current_act = Activity.find(params[:activity_id]);
      if(current_act)
          @log = Log.new
          @act_name = current_act.name
      else
          redirect_to root_path
      end
    end

    def create
        act_of_log = Activity.find(params[:activity_id]);
        if(act_of_log)
            log_to_save = Log.new
            log_to_save.description = params[:log][:description]
            log_to_save.done_at = params[:log][:done_at]
            log_to_save.activity = act_of_log
            if(log_to_save.save)
                 redirect_to root_path , notice: "Your log was added succesfully."
            else
                redirect_to new_activity_log_path(act_of_log) , alert: "Couldn't save your log, please fill all the neccesary fields."
            end
        else
            redirect_to root_path , alert: "Couldn't save your log, please select a valid habit."
        end




    end
end
