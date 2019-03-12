# spec/requests/dummy_operations_spec.rb
require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'DummyOperations API', type: :request do
  # initialize test data 
  let!(:dummy_operations) { create_list(:dummy_operation, 10) }
  let(:dummy_operation_id) { dummy_operations.first.id }

  # Test suite for GET /dummy_operations
  describe 'GET /dummy_operations' do
    # make HTTP get request before each example
    before { get '/dummy_operations' }

    it 'returns dummy_operations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /dummy_operations/:id
  describe 'GET /dummy_operations/:id' do
    before { get "/dummy_operations/#{dummy_operation_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(dummy_operation_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:dummy_operation_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find DummyOperation/)
      end
    end
  end

  # Test suite for POST /dummy_operations
  describe 'POST /dummy_operations' do
    # valid payload
    let(:valid_attributes) { {dummy_operation: {input: {waferMap: {id: 'ec219dc0-2547-0137-274b-02d7ac46faeb', waferID: 'Wafer123', valType: 'OverlayRaw' ,exposedFields: [], waferPoints: [], waferPointsCount: 10, waferMetrologyStepId: 100, exposedFieldsCount: 100, parentId: nil}}}} }
    let(:valid_attributes2) { {dummy_operation: {id: 'aa219dc0-2547-0137-274b-02d7ac46faeb', input: {waferMap: {id: 'ec219dc0-2547-0137-274b-02d7ac46faeb', waferID: 'Wafer123', valType: 'OverlayRaw' ,exposedFields: [{id: 1, width: 34.3, height: 45.5, posX: 3, diam: 300, posY: 5, scan: 'Upwards'}], waferPoints: [{id: 1, cfx: 34.3, cfy: 45.5, ifx: 3, ify: 300, valX: 5, valY: 4, val: 4, validX: true, validY: true}], waferPointsCount: 10, waferMetrologyStepId: 100, exposedFieldsCount: 100, parentId: nil}}}} }

    context 'when the request is valid' do
      before { post '/dummy_operations', params: valid_attributes.to_json, headers: { "CONTENT_TYPE" => "application/json" } }

      it 'creates a dummy operation' do
        expect(json['id']).not_to be_blank
        expect(json['input']['waferMap']['parentId']).to be_blank
        expect(json['output']).not_to be_blank
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is valid with more params' do
      before { post '/dummy_operations', params: valid_attributes2.to_json, headers: { "CONTENT_TYPE" => "application/json" }}
      
      it 'creates a dummy operation' do
        expect(json['id']).to eq('aa219dc0-2547-0137-274b-02d7ac46faeb')
        expect(json['output']['waferMap']['parentId']).to eq('ec219dc0-2547-0137-274b-02d7ac46faeb')
        expect(json['output']['waferMap']['id']).not_to eq('ec219dc0-2547-0137-274b-02d7ac46faeb')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/dummy_operations', params: { dummy_operation: { input: nil} }.to_json, headers: { "CONTENT_TYPE" => "application/json" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Input can't be blank/)
      end
    end

    context 'when the request is invalid with an existing id' do
      before { post '/dummy_operations', params: { dummy_operation: { input: nil} }.to_json, headers: { "CONTENT_TYPE" => "application/json" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Input can't be blank/)
      end
    end
  end

end

RSpec.describe "routes for Dummy Operations", type: :routing do
  # initialize test data 
  let!(:dummy_operations) { create_list(:dummy_operation, 10) }
  let(:dummy_operation_id) { dummy_operations.first.id }

  it "does not route to update" do
    expect(put: "/dummy_operations/#{dummy_operation_id}").not_to be_routable
  end
  it "does not route to delete" do
    expect(delete: "/dummy_operations/#{dummy_operation_id}").not_to be_routable
  end
end