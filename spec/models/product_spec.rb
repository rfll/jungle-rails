require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should save successfully for name, price, quantity, category' do
      @category = Category.new
      @category.id = 1
      @category.name = 'plant category'

      @product = Product.new
      @product.name = 'plant'
      @product.price = 1000
      @product.quantity = 1
      @product.category = @category

      @product.save
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.new
      @category.id = 1
      @category.name = 'plant category'

      @product = Product.new
      @product.name = nil
      @product.price = 1000
      @product.quantity = 1
      @product.category = @category

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.new
      @category.id = 1
      @category.name = 'plant category'

      @product = Product.new
      @product.name = 'plant'
      @product.price_cents = nil
      @product.quantity = 1
      @product.category = @category

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.new
      @category.id = 1
      @category.name = 'plant category'

      @product = Product.new
      @product.name = 'plant'
      @product.price = 1000
      @product.quantity = nil
      @product.category = @category

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @category = Category.new
      @category.id = 1
      @category.name = 'plant category'

      @product = Product.new
      @product.name = 'plant'
      @product.price = 1000
      @product.quantity = 1
      @product.category = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category must exist")
    end

  end
end
