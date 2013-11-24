class Match < ActiveRecord::Base
	has_many :pools
	has_many :games, through: :pools
end
