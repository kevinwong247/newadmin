class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.integer :salary
      t.string :education
      t.integer :cohort_id

      t.timestamps
    end
  end
end
