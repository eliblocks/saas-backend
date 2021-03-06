class Account < ApplicationRecord
	has_many :users, dependent: :destroy
	accepts_nested_attributes_for :users

	validates :name, presence: true, uniqueness: true
end
