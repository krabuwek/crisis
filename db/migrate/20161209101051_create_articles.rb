class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :user, null: false
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
