class CreateNations < ActiveRecord::Migration[5.2]
  def change
    create_table :nations do |t|
      t.string :nation_name

      t.timestamps
    end
  end
end
