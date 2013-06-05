ActiveRecord::Schema.define :version => 0 do
  create_table :editable_areas do |t|
    t.string :title, null: false
    t.text :content

    t.timestamps
  end

  add_index :editable_areas, :title
end