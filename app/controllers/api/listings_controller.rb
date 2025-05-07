class Api::ListingsController < ApplicationController
  before_action :authorize_request

  def index
    listings = Listing.all
    render json: listings
  end

  def create
    address_data = params.require(:address).permit(:street, :city, :state)
  
    state = State.find_by!(state_code: address_data[:state])
  
    address = Address.new(
      street: address_data[:street],
      city: address_data[:city],
      state: state
    )
  
    if address.save
      listing = @current_user.listings.build(listing_params.merge(address_id: address.id))

      if listing.save
        render json: { listing: listing, address: address }, status: :created
      else
        address.destroy
        render json: { errors: listing.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  
  private
  
  def listing_params
    params.require(:listing).permit(:bedrooms)
  end

  def address_params
    params.require(:address).permit(:street, :city, :state)
  end

end
