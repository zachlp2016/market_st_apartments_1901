require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'pry'

class BuildingTest < Minitest::Test

  def setup
    @jessie = Renter.new("Jessie")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @spencer = Renter.new("Spencer")
    @building = Building.new
  end

  def test_building_exists
    assert_instance_of Building, @building
  end

  def test_building_has_units
    assert_equal [], @building.units
  end

  def test_building_can_add_apartments
    @building.add_unit(@a1)
    @building.add_unit(@a2)
    assert_equal [@a1, @a2], @building.units
  end

  def test_building_can_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_building_can_find_renter_with_highest_rent
    @b2.add_renter(@spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal @spencer, @building.renter_highest_rent
  end

  def test_building_can_find_renter_with_highest_rent
    @b2.add_renter(@spencer)
    @a1.add_renter(@jessie)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal @jessie, @building.renter_highest_rent
  end

  def test_building_can_calculate_annual_breakdown_for_rent
    @b2.add_renter(@spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    hash1 = {"Spencer" => 11988}
    hash2 = {"Jessie" => 14400, "Spencer" => 11988}
    assert_equal hash1, @building.annual_breakdown
    @a1.add_renter(@jessie)
    assert_equal hash2, @building.annual_breakdown
  end
end
