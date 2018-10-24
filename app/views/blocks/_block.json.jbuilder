json.extract! block, :id, :title, :content, :column_id, :created_at, :updated_at
json.url block_url(block, format: :json)
