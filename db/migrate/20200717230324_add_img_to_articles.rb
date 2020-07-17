class AddImgToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :img, :string
  end
end
