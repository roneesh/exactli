class DocumentVersion < ActiveRecord::Base
  attr_accessible :document_id, :name

  belongs_to :document

end
