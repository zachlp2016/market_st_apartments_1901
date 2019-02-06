class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    units_sum = @units.sum do |unit|
      unit.monthly_rent.to_f
    end
    (units_sum / @units.length).round(2)
  end

  def renter_highest_rent
    @units.max_by do |unit|
      unit.monthly_rent
      return unit.renter
    end
  end

  def annual_breakdown
    new_hash = {}
    @units.each do |unit|
      if !new_hash.keys.include?(unit.renter) && unit.renter != nil
        new_hash[unit.renter.name] = (unit.monthly_rent * 12)
      elsif unit.renter != nil
        new_hash[unit.renter.name] << (unit.monthly_rent * 12)
      end
    end
    return new_hash
  end
end
