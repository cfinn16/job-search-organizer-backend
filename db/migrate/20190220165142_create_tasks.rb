class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :job_id
      t.string :integer

      t.timestamps
    end
  end
end
