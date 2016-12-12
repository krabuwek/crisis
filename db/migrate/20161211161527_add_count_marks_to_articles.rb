class AddCountMarksToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :marks_count, :integer, default: 0
  end
end
