# frozen_string_literal: true

class Genre < ApplicationRecord
  belongs_to :movie

  validates :name,
            presence: true
end
