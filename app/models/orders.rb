class Orders < ApplicationRecord
	validates :email, presence: true
	validates :country, presence: true

end
