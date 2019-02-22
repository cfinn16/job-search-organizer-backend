class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.integer :years_experience
      t.integer :salary
      t.string :contact_email
      t.string :description
      t.boolean :show_more

      t.timestamps
    end
  end
end
