class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :comment, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
