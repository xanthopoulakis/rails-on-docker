require 'descriptive_statistics'

class FilterOperation < Operation

  def process
    #### YOUR CODE GOES HERE!!
    self.output = self.input.clone
    self.output["waferMap"]["id"] = UUID.new.generate
    self.output["waferMap"]["parentId"] = self.input["waferMap"]["id"]
    
    validPoints = self.input["waferMap"]["waferPoints"].select{|x| x["validX"] && x["validY"] && 
      (((x["cfx"] + x["ifx"]) ** 2 + (x["cfy"] + x["ify"]) ** 2) < self.parameters["threshold"].to_f ** 2)}

    self.output["waferMap"]["waferPoints"] = validPoints
    
    self.output["waferMap"]["waferPointsCount"] = self.output["waferMap"]["waferPoints"].length
  end

end