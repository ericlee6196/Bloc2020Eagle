class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :location
      t.string :company
      t.string :level
      t.string :job_title
      t.string :url

      t.timestamps
    end
  end
end