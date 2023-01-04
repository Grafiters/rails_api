class Session::RegistersController < ApplicationController
    include ParamHelper
    include ResponHelper

    before_action :check_email_user, only: [:create]
    before_action :user_email, only: [:insert_to_mailer]
    after_action :insert_to_balance, only: [:create]
    after_action :insert_to_mailer, only: [:create]
    
    def create
        user = User.new(register_user_param)
        if user.save
            return render_registration(user.as_json(only: [:id, :name, :email, :status]))
        end

        return render_fail_204
    end

    def insert_to_balance
        user = find_by_email
        balance = Balance.create(balance_param(user[:id])[0])
    end

    private
    def find_by_email
        user = User.find_by(email: params[:email])
    end
end
