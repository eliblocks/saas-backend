class User < ApplicationRecord
	belongs_to :account

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :full_name, presence: true, length: { minimum: 4 }

  before_invitation_created :add_account

  def add_account
    self.account = invited_by.account
  end
end
