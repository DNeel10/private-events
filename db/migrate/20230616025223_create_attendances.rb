class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.belongs_to :event_attendee, class_name: "User", null: false, foreign_key: true
      t.belongs_to :attended_event, class_name: "Event", null: false, foreign_key: true

      t.timestamps
    end
  end
end
