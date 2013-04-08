class Annotation < ActiveRecord::Base
  attr_accessible :content, :document_version_id, :number, :user_id, :xcoor, :ycoor

  belongs_to :documentversion

end
