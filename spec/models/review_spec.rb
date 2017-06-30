require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body}
  it { should validate_numericality_of :rating }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :product_id }
  it { should belong_to :product }
end
