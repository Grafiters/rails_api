class Mailer < ApplicationRecord
    enum :status, [:pending, :registered, :verified, :expired]
end
