class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :product_id, :content_body, :presence => true
  validates :content_body, length: { minimum: 50, maximum: 250}

  validates :rating, numericality: true, :presence => true


end
