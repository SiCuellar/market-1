require 'pry'
class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    all_items = @vendors.inject([]) do |item_list, vendor|
      item_list << vendor.inventory.keys
    end
    all_items.sort.flatten.uniq
  end

  def total_inventory
      vendor_items = @vendors.flat_map do |vendor|
        vendor.inventory.keys
      end
      vendor_amount = @vendors.flat_map do |vendor|
        vendor.inventory.values
      end
      item_amount_pair = vendor_items.zip(vendor_amount)
      #is there a way to use uniq here?
      Hash[item_amount_pair]
  end


  def total_inventory_two
    vendor_items = @vendors.flat_map do |vendor|
      vendor.inventory
    end
    vendor_items.inject(Hash.new(0)) do |sum, vendor|
      x = vendor.group_by do |key, value|
        key
        binding.pry
      end
    end

  end

end
