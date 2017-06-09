class CreateTimetables < ActiveRecord::Migration[5.1]
  def change
    create_table :timetables do |t|
      t.references :user, :null => false
      t.integer :begins, :null => false
      t.integer :ends, :null => false
      t.string :content
      t.timestamps
    end
  end
end
