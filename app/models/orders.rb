class Orders < ActiveRecord::Base
	validates :email, presence: true
	validates :country, presence: true

end
