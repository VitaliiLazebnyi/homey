# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { "Project Title #{Time.now.to_f}" }
  end
end
