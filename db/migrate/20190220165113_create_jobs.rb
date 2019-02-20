class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :company
      t.string :years_experience
      t.string :integer
      t.string :contact_email
      t.string :description

      t.timestamps
    end
  end
end
