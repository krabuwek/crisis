class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.references :article
      t.references :user
      t.timestamps
    end
  end
end
