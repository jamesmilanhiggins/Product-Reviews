require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    product = Product.create(:name => 'James', :cost => '5', :country => "USA")
    visit product_path(product)
    click_on 'Edit Product'
    fill_in 'Name', :with => 'Updated James'
    fill_in 'Cost', :with => '3'
    fill_in 'Country', :with => 'Canada'
    click_on 'Update Product'
    expect(page).to have_content 'Updated James'
  end

  it "gives error when no name is entered" do
    product = Product.create(:name => 'James', :cost => '5', :country => "USA")
    visit product_path(product)
    click_on 'Edit Product'
    fill_in 'Name', :with => ''
    click_button 'Update Product'
    expect(page).to have_content 'errors'
  end
end
