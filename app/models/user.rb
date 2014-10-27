class User < ActiveRecord::Base
	belongs_to :league
	has_many :authorizations
	validates :name, :email, :presence => true
end