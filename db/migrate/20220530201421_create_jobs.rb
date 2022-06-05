class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :Job_title
      t.string :Job_description
      t.string :Requirements
      t.string :Time
      t.string :Level

      t.timestamps
    end
  end
end
