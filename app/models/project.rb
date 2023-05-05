# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  enum status: { initiated: 0, executed: 1, closed: 2 }, _default: 'initiated'

  has_many :updates, dependent: :destroy
end
