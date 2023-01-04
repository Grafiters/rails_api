class ApplicationController < ActionController::API
    private
    def find_email_user
        user = User.find_by(email: params[:email])
        
        user.nil? ? "" : render_duplicate(params[:email])
    end

    def insert_to_mailer
        mailer = Mailer.create(mailer_user_param[0])
        VerifyAccountMailer.with(email: params[:email], pin: mailer[:pin]).confirmation.deliver_now
    end

    def get_pin_user
        pin = Mailer.find_by(email: params[:email])

        pin.nil? ? "" : pin.pin
    end
end
