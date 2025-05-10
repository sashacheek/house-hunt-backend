class Picture < ApplicationRecord
  has_one_attached :image
  before_destroy :purge_image
  belongs_to :listing

  def get_url
    image.attached? ? Rails.application.routes.url_helpers.url_for(image) : nil
  end

  def purge_image
    image.purge if image.attached?
  end
end
