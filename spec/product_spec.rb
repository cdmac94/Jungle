require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes of name, price, quantity and category" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test_cat'
      
      @product = Product.new
      @product.name = "test_product"
      @product.price = 10000
      @product.quantity = 10000
      @product.category_id = @category

      @category.products = [@product]

      @product.save
      
      expect(@product).to be_valid
    end
    
    it "is invalid without a name" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test_cat'
      
      @product = Product.new
      @product.name = nil
      @product.price = 10000
      @product.quantity = 10000
      @product.category_id = @category
  
      @category.products = [@product]
  
      @product.save
      
      expect(@product).to_not be_valid
    end

    it "is invalid without a price" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test_cat'
      
      @product = Product.new
      @product.name = "test_product"
      @product.price = nil
      @product.quantity = 10000
      @product.category_id = @category
  
      @category.products = [@product]
  
      @product.save
      
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test_cat'
      
      @product = Product.new
      @product.name = "test_product"
      @product.price = 10000
      @product.quantity = nil
      @product.category_id = @category
  
      @category.products = [@product]
  
      @product.save
      
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      
      @product = Product.new
      @product.name = "test_product"
      @product.price = 10000
      @product.quantity = 10000
      @product.category_id = nil

      @product.save
      
      expect(@product).to_not be_valid
    end

  end
end