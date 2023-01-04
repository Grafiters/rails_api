class Balance < ApplicationRecord
    belongs_to :users, class_name: "User", foreign_key: "user_id"
    belongs_to :currencies, class_name: "Currency", foreign_key: "currencies_id"
end
