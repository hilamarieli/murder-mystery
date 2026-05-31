class Case < ApplicationRecord
    belongs_to :created_by, class_name: "User"

  enum :status, {
    idea: 0,
    in_progress: 1,
    active: 2,
    archived: 3
    }
end
