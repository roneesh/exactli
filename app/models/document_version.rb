class DocumentVersion < ActiveRecord::Base
  attr_accessible :document_id, :name, :file

  belongs_to :document

  has_many :annotations

  mount_uploader :file, FileUploader
  

end
