class CreateJobSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :job_saves do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :column

      t.timestamps
    end
  end
end
