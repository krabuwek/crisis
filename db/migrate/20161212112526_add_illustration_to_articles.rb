class AddIllustrationToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :illustration, :string
  end
end
