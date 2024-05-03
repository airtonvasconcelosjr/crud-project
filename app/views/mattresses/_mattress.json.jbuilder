# frozen_string_literal: true

json.extract! mattress, :id, :comfort, :description, :name, :size, :created_at, :updated_at
json.url mattress_url(mattress, format: :json)
