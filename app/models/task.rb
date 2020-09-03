class Task < ApplicationRecord
  belongs_to :account

  belongs_to :creator, class_name: 'User', foreign_key: "creator_id", optional: true
  belongs_to :completor, class_name: "User", foreign_key: "completor_id", optional: true

end
