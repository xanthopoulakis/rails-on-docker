class Operation < ApplicationRecord

  INPUT_JSON_SCHEMA = Rails.root.join('public', 'schemas', 'operation', 'input.json').to_s
  OUTPUT_JSON_SCHEMA = Rails.root.join('public', 'schemas', 'operation', 'output.json').to_s
  
  # validations
  validates :id, :type, presence: true
  validates :id, uniqueness: true, format: {with: /\A[\da-f]{8}-[\da-f]{4}-[\da-f]{4}-[\da-f]{4}-[\da-f]{12}\z/ }
  validates :input, presence: true, json: { message: ->(errors) { errors }, schema: INPUT_JSON_SCHEMA }
  validates :output, presence: true, json: { message: ->(errors) { errors }, schema: OUTPUT_JSON_SCHEMA }

  after_initialize :set_guid
  before_validation :process, if: Proc.new { |order| attribute_present?(:input) }

  private

  def set_guid
    self.id ||= UUID.new.generate
  end

end
