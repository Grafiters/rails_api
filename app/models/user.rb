class User < ApplicationRecord
    has_secure_password
    has_many :balances, class_name: "Balance", foreign_key: "balances_id"
    has_many :mailers, class_name: "Mailer", foreign_key: "mailer_id"

    enum status: [:pending, :registered, :verified]
end
