# While all tests pass, there are several issues with this test file. What do you see?
require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test

  def test_it_exists
    a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    assert_instance_of Apartment, a1
  end

  def test_it_has_attributes
    a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    assert_equal "A1",a1.number
    assert_equal 1200,a1.monthly_rent
    assert_equal 1, a1.bathrooms
    assert_equal 1, a1.bedrooms
    assert_nil a1.renter
  end

  def test_it_can_add_a_renter
    a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    jessie = Renter.new("Jessie")
    new_renter = a1.add_renter(jessie)
    assert_equal jessie, a1.renter
  end

end
