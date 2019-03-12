class FilterOperationsController < ApplicationController
  before_action :set_filter_operation, only: [:show]

  # GET /todos
  def index
    @filter_operations = FilterOperation.all
    json_response(@filter_operations)
  end

  # POST /todos
  def create
    @filter_operation = FilterOperation.create!(filter_operation_params)
    json_response(@filter_operation, :created)
  end

  # GET /todos/:id
  def show
    json_response(@filter_operation)
  end

  private

  def filter_operation_params
    # whitelist params
    params.require(:filter_operation).permit(:id, parameters: {}, input: {})
  end

  def set_filter_operation
    @filter_operation = FilterOperation.find(params[:id])
  end
end
