# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.date :date_of_creation
      t.integer :qualification

      t.timestamps
    end
  end
end
