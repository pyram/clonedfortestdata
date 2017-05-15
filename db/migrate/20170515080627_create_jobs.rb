class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :info

      t.timestamps
    end
  end
end
