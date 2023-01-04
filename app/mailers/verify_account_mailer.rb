class VerifyAccountMailer < ApplicationMailer
    def confirmation
        @user = params[:email]
        @pin = params[:pin]
        mail(
            to: @user,
            subject: 'Verify Email' 
        )
    end
end
