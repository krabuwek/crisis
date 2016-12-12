class CreateArticlesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :articles_tags do |t|
      t.references :article
      t.references :tag
    end
  end
end
