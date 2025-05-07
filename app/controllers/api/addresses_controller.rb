class Api::AddressesController < ApplicationController
  # allow_unauthenticated_access only: %i[ index ]
  skip_before_action :authorize_request, only: %i[index ]
  def index
    addresses = Address.all
    render json: addresses
  end
end
