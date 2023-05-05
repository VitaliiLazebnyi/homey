# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    enable_extension('citext')

    create_table :projects do |t|
      t.citext :title, null: false, index: { unique: true }
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
