require 'rails_helper'

RSpec.describe DummyOperation, type: :model do
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:id) }
  it { should validate_presence_of(:input) }
  it { should validate_presence_of(:output) }

  it "should have a unique id" do
    DummyOperation.create!(id: "bb4f8af0-24d4-0137-613c-3fd6e472d825", input: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [], waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}}, output: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [],waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}})
    foo = DummyOperation.new(id: "bb4f8af0-24d4-0137-613c-3fd6e472d825", input: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [], waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}}, output: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [],waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}})

    expect(foo).to_not be_valid
    expect(foo.errors[:id]).to include("has already been taken")
  end

  it "should have a valid id" do
    foo = DummyOperation.create(id: "bb4f8af0-24d4-0137-613c-3fd6e472d825-aaa", input: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [], waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}}, output: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [],waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}})

    expect(foo).to_not be_valid
    expect(foo.errors[:id]).to include("is invalid")
  end

  it "should have an id upon initialisation" do
    foo = DummyOperation.new()
    expect(foo.id).not_to be_blank
  end

  it "should have a created_at field timestamp" do
    foo = DummyOperation.new(id: "bb4f8af0-24d4-0137-613c-3fd6e472d825", input: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [], waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}}, output: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [],waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}})

    expect(foo.created_at).to be_blank
    foo.save
    expect(foo.created_at).not_to be_blank
    expect(Time.now - foo.created_at).to be < 1
  end
  
  it "should have a updated_at field timestamp" do
    foo = DummyOperation.new(id: "bb4f8af0-24d4-0137-613c-3fd6e472d825", input: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [], waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}}, output: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [],waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}})

    expect(foo.updated_at).to be_blank
    foo.save
    expect(foo.updated_at).not_to be_blank
    expect(Time.now - foo.updated_at).to be < 1
  end

  it "should have a valid input" do
    foo = DummyOperation.create!(input: {waferMap: {id: 'a93a6560-2547-0137-2749-02d7ac46faeb', waferID: 'ff',valType: 'dd',exposedFields: [{id: 1, posX: 3.4, posY: 3.4, width: 3.4, height: 3.4, scan: "Upwards", diam: 300.0}], waferPoints: [], waferPointsCount: 4, waferMetrologyStepId: 4, exposedFieldsCount: 3, parentId: 'a93a6560-2547-0137-2749-02d7ac46faeb'}})

    expect(foo).to be_valid
    expect(foo.output).not_to be_blank
    expect(foo.id).not_to be_blank
    expect(foo.output["waferMap"]["id"]).not_to be_blank
    expect(foo.output["waferMap"]["parentId"]).to eq("a93a6560-2547-0137-2749-02d7ac46faeb")
    expect(foo.output["waferMap"]["id"]).not_to eq("a93a6560-2547-0137-2749-02d7ac46faeb")
  end
end
