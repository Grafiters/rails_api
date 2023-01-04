class ChangeEmailsController < ApplicationController
    include ParamHelper
    include ResponHelper
    include JwtHelper

    before_action :authorized
    before_action :send_message_old_email, only: [:create]
    before_action :find_email_user, only: [:create]
    after_action :insert_to_mailer, only: [:create]

    def create
        find_user_to_change_email.update(email: params[:email])
        if find_user_to_change_email
            return render_response('Email has been change, now verify new email')
        end

        return render_fail_404
    end

    private
    def send_message_old_email
        prev_email = find_user_to_change_email[:email]
        ChangeEmailMailer.with(prev_email: prev_email, new_email: params[:email]).confirmation.deliver_now
    end

    def find_user_to_change_email
        user = User.find_by_id(user_id)
    end
end