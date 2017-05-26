class CreateTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :times do |t|
      t.references :user, :null => false
      t.integer :begin, :null => false
      t.integer :end, :null => false
      t.string :content
      t.timestamps
    end
  end
end
