class EditableAreasController < ApplicationController
  # PATCH/PUT /editable_area/1
	# PATCH/PUT /editable_area/1.json
  def update
    @editable_area = EditableArea.find(params[:id])
    authorize! :update, @editable_area if defined? CanCan::Ability

    respond_to do |format|
      if @editable_area.update_attributes(editable_area_params)
        format.html { redirect_to request.referrer.split('?').first, notice: 'Editable area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to request.referrer, notice: @editable_area.errors.full_messages.join(', ') }
        format.json { render json: @editable_area.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def editable_area_params
    params.require(:editable_area).permit(:content)
  end
end