class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :user_id
      t.integer :job_id
      t.boolean :is_completed

      t.timestamps
    end
  end
end
