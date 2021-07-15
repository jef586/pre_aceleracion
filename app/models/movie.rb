# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :disney_characters
  has_many :genres

  validates :title,
            :date_of_creation,
            :qualification,
            presence: true

  # validar con geather than la calificacion de 1 a 5 estrellas
  # scopes
  scope :for_title, ->(title) { where title: title }
  scope :for_creation_date, ->(date_of_creation) { where date_of_creation: date_of_creation }
end
