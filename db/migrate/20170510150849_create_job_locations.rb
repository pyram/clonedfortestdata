class CreateJobLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :job_locations do |t|
      t.string :name
      t.string :info
      t.string :url

      t.timestamps
    end
  end
end
