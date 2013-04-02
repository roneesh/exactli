class AddFileToDocumentVersion < ActiveRecord::Migration
  def change
    add_column :document_versions, :file, :string
  end
end
