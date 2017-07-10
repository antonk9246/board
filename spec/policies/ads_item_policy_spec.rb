require "rails_helper"

describe AdsItemPolicy do
  subject { described_class }
  let(:ads_item) { build_stubbed (:ads_item) }

  permissions :create? do
    let(:visitor) { nil }
    let(:user) { build_stubbed(:user) }

    # it { should_not permit(:visitor) }
    it { should permit(:user) }
  end
end
