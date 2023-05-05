# frozen_string_literal: true

class Update < ApplicationRecord
  belongs_to :project

  enum kind: { comment: 0, change_status: 1 }
end
