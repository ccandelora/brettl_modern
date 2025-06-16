json.extract! reservation, :id, :name, :wed, :thur, :fri, :sat, :sun, :mon, :tue, :dinner, :comment, :user_id, :reservation_week_id, :sex, :res_member_type, :reservation_date, :confirmation_number, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
