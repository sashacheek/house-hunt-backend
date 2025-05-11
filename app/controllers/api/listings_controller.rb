class Api::ListingsController < ApplicationController
  before_action :authorize_request
    skip_before_action :authorize_request, only: %i[index show]

  def index
    listings = Listing.includes(:address, pictures: :image_attachment)
      .where(pictures: { main_img: true })
    render json: listings.as_json(include: [:address, pictures: {methods: [:get_url]}])
  end

  def show
    listing = Listing.includes(:address, pictures: :image_attachment).find(params[:id])
    render json: listing.as_json(include: [:address, pictures: {methods: [:get_url]}])
  end

  def create
    # check state
    state = State.find_by!(state_code: address_params[:state])
  
    # create address
    address = Address.new(
      street: address_params[:street],
      city: address_params[:city],
      state: state,
      zip_code: address_params[:zip_code]
    )

    # check type
    type = Type.find_by!(id: listing_params[:type])

    # create listing
    if address.save
      listing = @current_user.listings.build(listing_params.merge(address_id: address.id, type: type))

      if listing.save
        main = Picture.new(main_img: 1, listing_id: listing.id)
        main.image.attach(images_params[:main])
        main.save!

        images_params[:all].each do |image|
          picture = Picture.new(main_img: 0, listing_id: listing.id)
          picture.image.attach(image)
          picture.save!
        end

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
    params.require(:listing).permit(:bedrooms, :bathrooms, :square_ft, :description, :type)
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code)
  end

  def images_params
    params.require(:images).permit(:main, all: [])
  end

end
