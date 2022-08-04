class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :start_day
      t.date :finish_day
      t.boolean :allday, null: false
      t.string :memo

      t.timestamps
    end
  end
end
