# spec/factories/dummy_operations.rb
FactoryBot.define do
  factory :dummy_operation do
    title { Faker::Lorem.word }
    input {{waferMap: {id: UUID.new.generate, waferID: Faker::Lorem.word ,valType: Faker::Lorem.word ,exposedFields: [], waferPoints: [], waferPointsCount: rand(100).to_s, waferMetrologyStepId: rand(100).to_s, exposedFieldsCount: rand(100).to_s, parentId: UUID.new.generate}}}
  end
end