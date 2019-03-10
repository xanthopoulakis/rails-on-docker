class Operation < ApplicationRecord

  INPUT_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'operation', 'input.json').to_s
  OUTPUT_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'operation', 'output.json').to_s
  
  # validations
  validates :id, :title, :type, presence: true
  validates :id, uniqueness: true, format: {with: /\A[\da-f]{8}-[\da-f]{4}-[\da-f]{4}-[\da-f]{4}-[\da-f]{12}\z/ }
  validates :input, presence: true, json: { message: ->(errors) { errors }, schema: INPUT_JSON_SCHEMA }
  #validates :output, presence: true, json: { message: ->(errors) { errors }, schema: OUTPUT_JSON_SCHEMA }

  after_initialize :set_guid

  private

  def set_guid
    self.id ||= UUID.new.generate
  end

end
