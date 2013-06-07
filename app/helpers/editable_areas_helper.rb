module EditableAreasHelper
  def render_or_edit_area(title, accessible: true)
    editable_area = EditableArea.place(title)

    if params[:edit] && accessible
      render 'editable_areas/form', :editable_area => editable_area
    else
      render 'editable_areas/editable_area', :editable_area => editable_area
    end
  end

  def render_edit_area_button(accessible: true)
    link_to 'Edit', request.fullpath + '?edit=true', :class => 'editable_area_btn' if params[:edit].blank? && accessible
  end

  def render_or_edit_area_with_button(title, accessible: true)
    content_tag :div, :class => 'editable_area' do
      render_or_edit_area(title, accessible: accessible) + render_edit_area_button(accessible: accessible)
    end.html_safe
  end
end