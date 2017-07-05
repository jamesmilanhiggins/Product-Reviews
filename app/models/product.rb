class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true

 scope :updatedNew, -> { order(updated_at: :desc).limit(3)}
 scope :createdNew, -> { order(created_at: :desc).limit(3)}
 scope :localCountry, -> { where(country: "USA")}
 scope :mostReviews, -> {(
   select("products.id, products.name, products.cost, products.country, count(reviews.id) as reviews_count")
   .joins(:reviews)
   .group("products.id")
   .order("reviews_count DESC")
   .limit(1)
   )}

end
