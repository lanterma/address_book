class Person < ActiveRecord::Base
  validates_presence_of :first_name, presence: true
  validates_presence_of :last_name, presence: true


  STATE_ABBREVIATIONS = ISO3166::Country.find_country_by_name('united states').states.keys
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :email, :presence => true,
                    :length => { :maximum => 50 },
                    :uniqueness => true,
                    :format =>{ :with => EMAIL_REGEX  },
                    :confirmation => true



  validates :state, :presence => true,
    :length => { :maximum => 2 },
    :inclusion => { :in => STATE_ABBREVIATIONS.upcase  },
    :confirmation => true

end





# validate :check_empty_space
#
# def check_empty_space
#   if self.attribute.match(/\s+/)
#     errors.add(:attribute, "No empty spaces please :(")
#   end
# end