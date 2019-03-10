class DummyOperation < Operation

  cattr_reader :description, default: 'this is a dummy operation'
  before_save :process

  def process
    #### YOUR CODE GOES HERE!!
    self.output = self.input.clone
    self.output["waferMap"]["id"] = UUID.new.generate
    self.output["waferMap"]["parentId"] = self.input["waferMap"]["id"]
  end

end