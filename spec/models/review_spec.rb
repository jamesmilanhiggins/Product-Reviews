require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body}
  it { should validate_numericality_of :rating }
  it { should validate_presence_of :product_id }
  it { should belong_to :product }
  # it ( "should return an eror if body is more than 250 characters")  do
  #   product = Product.create!({name: "James", cost: "4", country: "USA"})
  #   review = Review.create!({author: "James", content_body: "4" * 260, rating: "4", product_id: product.id})
  #   expect(review.save).to eq(false)
  # end

end
