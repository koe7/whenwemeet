class CreateGroupJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :group_joins do |t|
      t.references :user, :null => false
      t.references :group, :null => false
      t.integer :status, :null => false
      t.timestamps
    end
  end
end
