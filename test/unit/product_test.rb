require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixures :products

 test "Product attibutes must not be empty" do
   product = Product.new
   assert product.invalid?
   assert product.errors[:title].any?
   assert product.errors[:description].any?
   assert product.errors[:price].any?
   assert product.errors[:image_url].any?
 end
  
  test "Prodcut price must be positive" do
    product = Product.new(:title => "My Book Title",
                        :description => "yyy",
                        :image_url => "zzz.jpg")
   product.price = -1
   assert product.invalid?
   assert_equal "myst be greater than or equal to 0.01",
    product.errors[:price].join(';')
   
   product.price = 1 
   assert product.valid?
  end
end
