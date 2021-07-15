# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.belongs_to :movie
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
