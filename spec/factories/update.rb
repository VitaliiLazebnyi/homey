# frozen_string_literal: true

FactoryBot.define do
  factory :update do
    project
    title { "Update Title #{Time.now.to_f}" }
    kind { 'comment' }
  end
end
