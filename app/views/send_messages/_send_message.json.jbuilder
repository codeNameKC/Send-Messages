json.extract! send_message, :id, :PhoneNumber, :Message, :created_at, :updated_at
json.url send_message_url(send_message, format: :json)
