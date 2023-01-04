class Session::LoginsController < ApplicationController
    include ParamHelper
    include ResponHelper
    include JwtHelper

    def create
        user = User.find_by(email: login_user_param[:email])
        if user && user.authenticate(login_user_param[:password])
            return render_session(gen_token(user), user.as_json(only: [:id, :name, :email, :status]))
        end

        return render_fail_404
    end
end