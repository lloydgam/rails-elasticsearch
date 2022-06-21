json.extract! mbs_item, :id, :reference, :start_date, :end_date, :is_latest, :description, :created_at, :updated_at
json.url mbs_item_url(mbs_item, format: :json)
