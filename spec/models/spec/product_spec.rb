require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new(name: "Test Category")
    @product = Product.new(name: "Rose", price: 25.00, quantity: 10, category: @category)
  end
  describe 'Validations' do

    it "validates a name" do
      expect(@product.name).to be_present
    end

    it "checks for a price to be available" do
      expect(@product.price).to be_present
    end

    it "checks for a quantity to be available" do
      expect(@product.quantity).to be_present
    end

    it "checks for a category to be available" do
      expect(@product.category).to be_present
    end

  end
end
