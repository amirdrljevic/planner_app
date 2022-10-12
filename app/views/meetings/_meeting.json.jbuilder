json.extract! meeting, :id, :user_id, :title, :description, :meeting_date, :meeting_time, :meeting_place, :status, :tags, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
