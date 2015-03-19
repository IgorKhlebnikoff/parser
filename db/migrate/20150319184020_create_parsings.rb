class CreateParsings < ActiveRecord::Migration
  def change
    create_table :parsings do |t|
      t.string :name
      t.string :html_resource

      t.timestamps null: false
    end
  end
end
