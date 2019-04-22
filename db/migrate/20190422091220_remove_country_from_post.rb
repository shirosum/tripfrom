class RemoveCountryFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :country, :string
  end
end
