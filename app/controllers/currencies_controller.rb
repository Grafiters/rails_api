class CurrenciesController < ApplicationController
    include ResponHelper

    def index
        data = Currency.all()
        render_response(data)
    end
end
