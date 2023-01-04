module ParamHelper
    def register_user_param
        params.permit(:name, :email, :password)
    end

    def login_user_param
        params.permit(:email, :password)
    end

    def mailer_user_param
        data = [
            :email  => params[:email],
            :pin    => rand(1000000).to_s.rjust(6, "0"),
        ]
    end

    def confirm_param
        pin = params[:pin]
    end

    def change_email_param
        params.permit(:email)
    end
end