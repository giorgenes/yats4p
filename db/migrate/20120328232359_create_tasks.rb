class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed
      t.date :due

      t.timestamps
    end
  end
end
