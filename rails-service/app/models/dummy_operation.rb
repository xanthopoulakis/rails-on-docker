require 'descriptive_statistics'

class DummyOperation < Operation

  def process
    #### YOUR CODE GOES HERE!!
    self.output = self.input.clone
    self.output["waferMap"]["id"] = UUID.new.generate
    self.output["waferMap"]["parentId"] = self.input["waferMap"]["id"]
    
    validPoints = self.input["waferMap"]["waferPoints"].select{|x| x["validX"] && x["validY"] && (x["valX"] > self.parameters["threshold"].to_f)}

    values = validPoints.map{|x| x["valX"].abs}
    meanValue = values.mean
    stddev = values.standard_deviation

    validPoints = validPoints.select{|x| x["valX"] > (meanValue + 3 * stddev)}

    puts "the mean value is #{meanValue}, the valids are #{validPoints}"
    
    self.output["waferMap"]["waferPoints"] = validPoints
    
    self.output["waferMap"]["waferPointsCount"] = self.output["waferMap"]["waferPoints"].length
  end

end