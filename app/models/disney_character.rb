# frozen_string_literal: true

class DisneyCharacter < ApplicationRecord
  # asociations
  belongs_to :movie, optional: true

  # validations
  validates :name,
            :age,
            :weight,
            :history,
            presence: true

  # scopes
  scope :for_name, ->(name) { where name: name }
  scope :for_age, ->(age) { where age: age }
end
