class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :location
      t.boolean :open

      t.timestamps
    end
  end
end
