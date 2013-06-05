require 'spec_helper'

describe EditableAreasController do
	before :each do
		request.env["HTTP_REFERER"] = "http://localhost:3000"
	end

	def valid_attributes
		{ "title" => "MyString" }
	end

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested editable_area" do
				editable_area = EditableArea.create! valid_attributes
				# Assuming there are no other editable_areas in the database, this
				# specifies that the Area created on the previous line
				# receives the :update_attributes message with whatever params are
				# submitted in the request.
				EditableArea.any_instance.should_receive(:update_attributes).with({ "content" => "MyString" })
				put :update, {:id => editable_area.to_param, :editable_area => { "content" => "MyString" }}
			end

			it "assigns the requested editable_area as @editable_area" do
				editable_area = EditableArea.create! valid_attributes
				put :update, {:id => editable_area.to_param, :editable_area => valid_attributes}
				assigns(:editable_area).should eq(editable_area)
			end

			it "redirects to the editable_area" do
				editable_area = EditableArea.create! valid_attributes
				put :update, {:id => editable_area.to_param, :editable_area => valid_attributes}
				response.should redirect_to(request.referrer)
			end
		end

		describe "with invalid params" do
			it "assigns the editable_area as @editable_area" do
				editable_area = EditableArea.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				EditableArea.any_instance.stub(:save).and_return(false)
				put :update, {:id => editable_area.to_param, :editable_area => { "title" => "invalid value" }}
				assigns(:editable_area).should eq(editable_area)
			end

			it "re-renders the 'edit' template" do
				editable_area = EditableArea.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				EditableArea.any_instance.stub(:save).and_return(false)
				put :update, {:id => editable_area.to_param, :editable_area => { "title" => "invalid value" }}
				response.should redirect_to(request.referrer)
			end
		end
	end
end
