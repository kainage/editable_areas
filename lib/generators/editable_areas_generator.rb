require 'rails/generators/migration'

class EditableAreasGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path("../templates", __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_editable_areas_files
    migration_template "create_editable_areas.rb", "db/migrate/create_editable_areas.rb"
  end
end