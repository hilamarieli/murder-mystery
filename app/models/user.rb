class User < ApplicationRecord
  attr_writer :login
  has_many :created_cases, foreign_key: :created_by_id, class_name: "Case"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
                 uniqueness: { case_sensitive: false }

  def login
    @login || self[:email] || self[:name]
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).find_by(
        [ "lower(email) = :value OR lower(name) = :value", { value: login.strip.downcase } ]
      )
    else
      where(conditions.to_h).first
    end
  end
end
