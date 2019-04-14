class AddNationIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :nation_id, :integer
  end
end
