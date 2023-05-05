# frozen_string_literal: true

class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.text :text
      t.integer :project_id, null: false, index: true
      t.integer :kind, null: false, index: true
      t.timestamps
    end
  end
end
