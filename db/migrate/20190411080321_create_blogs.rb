class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :category
      t.datetime :blog_date

      t.timestamps
    end
  end
end
