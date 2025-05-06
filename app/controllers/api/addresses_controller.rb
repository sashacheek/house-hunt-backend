class Api::AddressesController < ApplicationController
  skip_before_action :authorize_request, only: %i[index show]
  
    def index
      addresses = Address.all
      render json: addresses
    end
  end
  
  def index
    addresses = Address.all
    render json: addresses
  end
end
