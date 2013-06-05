require 'spec_helper'

describe EditableAreasHelper do
  before :each do
    @area = EditableArea.create!(title: 'New', content: 'Content')
  end

  it "should render text when no edit parameter is given" do
    output = helper.render_or_edit_area('New')
    expect(output).to match(/Content/)
  end

  it "should render the form when edit parameter is given" do
    params[:edit] = true
    output = helper.render_or_edit_area('New')
    expect(output).to match(/class="edit_editable_area"/)
  end

  context "edit button" do
    it "should render when no edit parameter is given" do
      output = helper.render_edit_area_button
      expect(output).to match(/class="editable_area_btn"/)
    end

    it "should NOT render when no edit parameter is given and accessiblity is false" do
      output = helper.render_edit_area_button(accessible: false)
      expect(output).to be_nil
    end

    it "should NOT render when edit parameter is given" do
      params[:edit] = true
      output = helper.render_edit_area_button
      expect(output).to be_nil
    end

    it "should NOT render when edit parameter is given and accessiblity is false" do
      params[:edit] = true
      output = helper.render_edit_area_button(accessible: false)
      expect(output).to be_nil
    end
  end

  it "should render both area and button properly with NO edit parameter" do
    output = helper.render_or_edit_area_with_button('New')

    expect(output).to match(/Content/)
    expect(output).to match(/class="editable_area_btn"/)
  end

  it "should render both area and button properly with edit parameter" do
    params[:edit] = true
    output = helper.render_or_edit_area_with_button('New')

    expect(output).to match(/class="edit_editable_area"/)
    expect(output).to_not match(/class="editable_area_btn"/)
  end
end