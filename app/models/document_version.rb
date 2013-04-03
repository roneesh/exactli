class DocumentVersion < ActiveRecord::Base
  attr_accessible :document_id, :name, :file

  belongs_to :document

  mount_uploader :file, FileUploader
  

end
