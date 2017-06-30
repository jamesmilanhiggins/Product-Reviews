require 'rails_helper'

describe "the  add review process" do
  it "adds a review" do
    product = Product.create(:name => 'James', :cost => '5', :country => "USA")
    review = Review.create(:author => 'Mike',:content_body => '1' * 51, :rating => '4', :product_id => product.id)
    visit product_path(product)
    click_on 'Add A Review'
    fill_in 'Author', :with => 'Updated James'
    fill_in 'Content body', :with => 'U' * 51
    fill_in 'Rating', :with => '3'
    click_on 'Create Review'
    expect(page).to have_content 'Updated James'
  end

  it "gives error when no description is entered" do
    product = Product.create(:name => 'James', :cost => '5', :country => "USA")
    review = Review.create(:author => 'Mike',:content_body => 't' * 51, :rating => '4', :product_id => product.id)
    visit product_path(product)
    click_on 'Add A Review'
    fill_in 'Author', :with => ''
    click_button 'Create Review'
    expect(page).to have_content 'errors'
  end
end
