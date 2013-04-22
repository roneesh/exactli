class AddAccessLinkToDocumentVersion < ActiveRecord::Migration
  def change
    add_column :document_versions, :access_link, :string
  end
end
