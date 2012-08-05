class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :website
      t.string :insured
      t.float :latitude
      t.float :longitude
      t.integer :service_id

      t.timestamps
    end
  end
end
