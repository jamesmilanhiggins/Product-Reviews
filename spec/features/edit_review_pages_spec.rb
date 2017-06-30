require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create(:name => 'James', :cost => '5', :country => "USA")
    review = Review.create(:author => 'Mike',:content_body => 'test text', :rating => '5', :product_id => product.id)
    visit product_path(product)
    click_on 'Edit Review'
    fill_in 'Author', :with => 'Updated James'
    fill_in 'Content body', :with => 'Updated test text'
    fill_in 'Rating', :with => '5'
    click_on 'Update Review'
    expect(page).to have_content 'Updated James'
  end

  it "gives error when no description is entered" do
    product = Product.create(:name => 'James', :cost => '5', :country => "USA")
    review = Review.create(:author => 'Mike',:content_body => 'test text', :rating => '5', :product_id => product.id)
    visit product_path(product)
    click_on 'Edit Review'
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end
end
