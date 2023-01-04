class Currency < ApplicationRecord
    has_one :balances, class_name: "Balance", foreign_key: "balances_id"
end
