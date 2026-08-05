class Case < ApplicationRecord
  belongs_to :created_by, class_name: "User"
  has_many :personas, dependent: :destroy

  enum :status, {
    idea: 0,
    in_progress: 1,
    active: 2,
    archived: 3
  }
end
