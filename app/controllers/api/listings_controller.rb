class Api::ListingsController < ApplicationController
  before_action :authorize_request

  def index
    listings = Listing.all
    render json: listings
  end

  def create
    # check state
    state = State.find_by!(state_code: address_params[:state])
  
    # create address
    address = Address.new(
      street: address_params[:street],
      city: address_params[:city],
      state: state
    )

    # check type
    type = Type.find_by!(id: type_params[:type])

    # create listing
    if address.save
      listing = @current_user.listings.build(listing_params.merge(address_id: address.id, type_id: type.id))

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
    params.require(:listing).permit(:bedrooms, :bathrooms, :square_ft, :description)
  end

  def address_params
    params.require(:address).permit(:street, :city, :state)
  end

  def type_params
    params.require(:listing).permit(:type)
  end

end
