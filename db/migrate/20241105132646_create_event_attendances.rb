class CreateEventAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :event_attendances do |t|
      t.references :event
      t.references :attendee, foreign_key: { to_table: :users }
    end
  end
end
