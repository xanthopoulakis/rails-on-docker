# spec/factories/dummy_operations.rb
FactoryBot.define do
  factory :dummy_operation do
    input {{ 
      waferMap: {
        id: UUID.new.generate,
        waferID: Faker::Lorem.word,
        valType: Faker::Lorem.word,
        exposedFields: 10.times.map{|x| 
          {
            id: x,
            width: 34.3,
            height: 45.5,
            diam: 300,
            posX: (30 * rand),
            posY: (30 * rand),
            scan: ['Upwards', 'Downwards'].shuffle.first,
            scanPath: ['Left', 'Right'].shuffle.first
          }
        },
        waferPoints: 20.times.map{|x| 
          {
            id: x,
            cfx: (30 * rand),
            cfy: (30 * rand),
            ifx: (30 * rand),
            ify: (30 * rand),
            valX: (3 * rand),
            valY: (4 * rand),
            val: (5 * rand),
            validX: [true,false].shuffle.first,
            validY: [true,false].shuffle.first
          }
        },
        waferPointsCount: 20,
        waferMetrologyStepId: rand(100),
        exposedFieldsCount: 10,
        parentId: UUID.new.generate}}}
  end
end