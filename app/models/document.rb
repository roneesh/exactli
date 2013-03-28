class Document < ActiveRecord::Base
  attr_accessible :access_link, :document_name, :project_name, :user_id
end
