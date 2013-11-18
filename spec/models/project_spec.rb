require 'spec_helper'

describe Project do
  it { should validate_presence_of(:name) }

  it "should generate a uid on creation" do
    subject.name = "Sample name"

    subject.save!

    expect(subject.uid).not_to be_blank
    expect(subject.uid.length).to eql(32)
  end
end
