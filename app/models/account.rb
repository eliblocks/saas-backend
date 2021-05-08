class Account < ApplicationRecord
	has_many :users, dependent: :destroy
  has_many :tasks
	accepts_nested_attributes_for :users

	validates :name, presence: true, uniqueness: true

  def is_limited
    plan == "free" && tasks.count > 2
  end
end
