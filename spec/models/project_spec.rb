# frozen_string_literal: true

RSpec.describe Project do
  subject { build(:project) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
  it { is_expected.to have_many(:updates).dependent(:destroy) }
  it { is_expected.to define_enum_for(:status).with_values(%i[initiated executed closed]) }
end
