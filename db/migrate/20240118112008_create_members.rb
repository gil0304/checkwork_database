class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :course
      t.integer :age
      t.timestamps null: false
    end
  end
end
