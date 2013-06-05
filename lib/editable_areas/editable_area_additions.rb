module EditableAreas
  module EditableAreaAdditions
    def self.included(editable_area_model)
      editable_area_model.validates :title, presence: true

      def editable_area_model.place(title)
        self.where(title: title).first_or_create
      end
    end
  end
end