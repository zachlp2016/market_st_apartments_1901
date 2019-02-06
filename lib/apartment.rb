# While this class does what it should do, what is one issue you see with the way this class is written?
class Apartment

  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms,
              :renter

  def initialize(info)
    @number       = info[:number]
    @monthly_rent = info[:monthly_rent]
    @bathrooms    = info[:bathrooms]
    @bedrooms     = info[:bedrooms]
  end

  def add_renter(renter)
    @renter = renter
  end

end
