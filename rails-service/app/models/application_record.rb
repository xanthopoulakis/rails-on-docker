class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.table_name 
    "#{self.name.underscore.upcase}"
  end
end
