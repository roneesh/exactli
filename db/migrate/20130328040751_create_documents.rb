class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.string :project_name
      t.string :document_name
      t.string :access_link

      t.timestamps
    end
  end
end
