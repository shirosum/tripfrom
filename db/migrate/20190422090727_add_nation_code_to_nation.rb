class AddNationCodeToNation < ActiveRecord::Migration[5.2]
  def change
    add_column :nations, :nation_code, :string
  end
end
