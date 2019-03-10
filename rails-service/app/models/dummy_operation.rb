class DummyOperation < Operation

  def process
    #### YOUR CODE GOES HERE!!
    self.output = self.input.clone
    self.output["waferMap"]["id"] = UUID.new.generate
    self.output["waferMap"]["parentId"] = self.input["waferMap"]["id"]
  end

end