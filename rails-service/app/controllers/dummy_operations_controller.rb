class DummyOperationsController < ApplicationController
  before_action :set_dummy_operation, only: [:show]

  # GET /todos
  def index
    @dummy_operations = DummyOperation.all
    json_response(@dummy_operations)
  end

  # POST /todos
  def create
    @dummy_operation = DummyOperation.create!(dummy_operation_params)
    json_response(@dummy_operation, :created)
  end

  # GET /todos/:id
  def show
    json_response(@dummy_operation)
  end

  private

  def dummy_operation_params
    # whitelist params
    params.require(:dummy_operation).permit!
  end

  def set_dummy_operation
    @dummy_operation = DummyOperation.find(params[:id])
  end
end
