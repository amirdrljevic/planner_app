class CreateMeetings < ActiveRecord::Migration[7.0]
  enable_extension "plpgsql"
  
  def change
    create_enum "status", ["open", "closed", "postponed", "n/a"]

    create_table :meetings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.date :meeting_date
      t.time :meeting_time
      t.string :meeting_place, null: false
      t.enum :status, default: "n/a", null: false, enum_type: "status"
      t.string :tags

      t.timestamps
    end
  end
end
