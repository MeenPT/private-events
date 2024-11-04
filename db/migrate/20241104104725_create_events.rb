class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.string :location, null: false
      t.text :extra_information
      t.timestamps
    end
  end
end
