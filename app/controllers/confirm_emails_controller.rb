class ConfirmEmailsController < ApplicationController
    include ParamHelper
    include ResponHelper

    before_action :find_pin_user, only: [:create]
    after_action  :update_pin, only: [:create]

    def create
        find_email.update(status: 2)
    end
    
    def update_pin
        find_pin_user.update(status: 2)
    end

    private
    def find_email
        user = User.find_by(email: find_pin_user[:email])
    end

    def find_pin_user
        mailer = Mailer.find_by(pin: confirm_param)
    end
end
