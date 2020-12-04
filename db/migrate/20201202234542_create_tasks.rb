class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
