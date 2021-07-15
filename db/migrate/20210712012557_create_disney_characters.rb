# frozen_string_literal: true

class CreateDisneyCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :disney_characters do |t|
      t.belongs_to :movie
      t.string :image
      t.string :name
      t.integer :age
      t.decimal :weight
      t.string :history

      t.timestamps
    end
  end
end
