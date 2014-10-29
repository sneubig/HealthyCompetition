class League < ActiveRecord::Base
	has_many :users
	has_many :teams
	has_many :matchups, through: :teams
end