json.extract! send_email, :id, :Email, :Message, :created_at, :updated_at
json.url send_email_url(send_email, format: :json)
