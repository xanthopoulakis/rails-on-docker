class WaferMap < Valuable

  has_collection :wafer_points
  has_value :count, klass: :integer, default: 0

  def process
    self.count = self.wafer_points.length
    return self
  end

end