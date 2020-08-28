class User < ApplicationRecord
	belongs_to :account

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :full_name, presence: true, length: { minimum: 4 }
end
