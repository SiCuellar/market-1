require 'minitest/emoji'
require 'minitest/autorun'
require './lib/vendor'

class VendorTest < Minitest::Test
  def test_it_exist
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_has_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal ({}), vendor.inventory
  end

  def test_it_can_check_inventory_stock_based_on_name
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_can_stock_item
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)

    assert_equal 30, vendor.check_stock("Peaches")
  end

  def test_it_can_stock_when_there_are_already_items
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)

    assert_equal 55, vendor.check_stock("Peaches")
  end

  def test_it_can_check_all_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)

    expected = {"Peaches"=>55, "Tomatoes"=>12}

    assert_equal expected, vendor.inventory
  end

end
