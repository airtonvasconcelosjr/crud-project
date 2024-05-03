# frozen_string_literal: true

class Mattress < ApplicationRecord
  has_many_attached :images
end
