# frozen_string_literal: true

RSpec.describe Update do
  it { is_expected.to belong_to(:project) }
  it { is_expected.to define_enum_for(:kind).with_values(%i[comment change_status]) }
end
