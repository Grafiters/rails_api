class Session::RegistersController < ApplicationController
    include ParamHelper
    include ResponHelper

    before_action :find_email_user, only: [:create]
    before_action :user_email, only: [:insert_to_mailer]
    after_action :insert_to_mailer, only: [:create]
    
    def create
        user = User.new(register_user_param)
        if user.save
            return render_registration(user.as_json(only: [:id, :name, :email, :status]))
        end

        return render_fail_204
    end
    
end
