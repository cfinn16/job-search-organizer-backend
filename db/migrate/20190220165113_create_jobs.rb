class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :experience_level
      t.integer :salary
      t.string :description

      t.timestamps
    end
  end
end
