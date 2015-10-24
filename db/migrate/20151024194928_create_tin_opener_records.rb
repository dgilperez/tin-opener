class CreateTinOpenerRecords < ActiveRecord::Migration
  def change
    create_table :tin_opener_records do |t|
      t.hstore :row_data
      t.belongs_to :data_set

      t.timestamps null: false
    end
  end
end
