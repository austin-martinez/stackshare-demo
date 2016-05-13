class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :name
      t.string :slug
    end
  end
end
