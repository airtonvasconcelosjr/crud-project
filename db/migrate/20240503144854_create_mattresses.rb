# frozen_string_literal: true

class CreateMattresses < ActiveRecord::Migration[7.1]
  def change
    create_table :mattresses do |t|
      t.string :company
      t.string :confort
      t.string :size
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
