class CreateTinOpenerDataSets < ActiveRecord::Migration
  def change
    create_table :tin_opener_data_sets do |t|
      t.string :name
      t.hstore :headers

      t.timestamps null: false
    end
  end
end
