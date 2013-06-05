require 'spec_helper'

describe EditableArea do
	before :each do
    @editable_area = EditableArea.create!(title: 'Title')
  end

	specify { @editable_area.should be_valid }
	specify { @editable_area.should validate_presence_of :title }

  it "should create record if not exist (place method)" do
    editable_area = EditableArea.place('New Title')

    expect(editable_area.should).to eq EditableArea.last
  end

  it "should find record if exists (place method)" do
    editable_area = EditableArea.place('Area')
    expect(editable_area.should).to eq EditableArea.last

    editable_area2 = EditableArea.place('Area')
    expect(editable_area).to eq editable_area2
  end
end
