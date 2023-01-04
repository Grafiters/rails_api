class UsersController < ApplicationController
    include ParamHelper
    include ResponHelper
    include JwtHelper

    before_action :authorized

    def show
        user = merge_data_user(get_user_detail, get_balance, pin(get_user_detail[:email]))
        if user
            return render_response(user)
        end

        return render_fail_404
    end

    private
    def get_user_detail
        user = User.find_by_id(user_id)
    end

    def get_balance
        balance = Balance.find_by(user_id: user_id).as_json(only: [:amount])
    end

    def pin(email)
        pin = Mailer.find_by(email: email).as_json(only: [:pin])
    end

    def merge_data_user(user, balance, pin)
        result = user.as_json(only: [:name, :email, :status]).merge({pin: pin, balance: balance})
    end
end
