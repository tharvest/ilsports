class Game < ActiveRecord::Base
	has_many :pools
	has_many :matches, through: :appointments
end
