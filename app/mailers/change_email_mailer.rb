class ChangeEmailMailer < ApplicationMailer
    def confirmation
        @prev_email = params[:prev_email]
        @new_email = params[:new_email]
        mail(
            to: @prev_email,
            subject: 'Change Email' 
        )
    end
end
