class City < ActiveRecord::Base
  validates :elevation,
    numericality: {
    greater_than_or_equal_to: 3315,
    if: lambda { |city| city.state == "CO"},
    message: 'is too low, lowest point in CO is 3315 feet.'
  }


  # country = ISO3166::Country.search('US')
  # state = country.state

STATE_ABBREVIATIONS = ISO3166::Country.find_country_by_name('united states').states.keys

  validates :state, :presence => true,
                    :length => { :maximum => 2 },
                    :inclusion => { :in => STATE_ABBREVIATIONS  },
                    :confirmation => true

  validates :population, numericality: { greater_than: 0 },
                          :presence => true

end
