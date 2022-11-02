json.extract! comment, :id, :meeting_id, :user_id, :text_comment, :created_at, :updated_at
json.url comment_url(comment, format: :json)
