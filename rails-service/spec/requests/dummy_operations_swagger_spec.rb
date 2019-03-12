# spec/requests/dummy_operations_spec.rb
require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'DummyOperations API', type: :request do
  # initialize test data 
  let!(:dummy_operations) { create_list(:dummy_operation, 10) }
  let(:dummy_operation_id) { dummy_operations.first.id }

  path '/dummy_operations' do

    get(summary: 'list dummy_operations') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    post(summary: 'create dummy_operation') do
      # Parameter Object for content type could be defined like:
      consumes 'application/json'
      # or:
      #parameter 'Content-Type', {in: :header, type: :string}
      let(:'Content-Type') { 'application/json' }
 
      parameter "dummy_operation", in: :body, schema: JSON.parse(File.read('public/schemas/operation/dummy_operation/create.json'))
      let(:dummy_operation) { {input: {waferMap: {id: UUID.new.generate, waferID: 'Wafer123', valType: 'OverlayRaw' ,exposedFields: [], waferPoints: [], waferPointsCount: 10, waferMetrologyStepId: 100, exposedFieldsCount: 100, parentId: nil}}}}

      response(201, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/dummy_operations/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { dummy_operations.first.id }

    get(summary: 'show dummy_operation') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

end
