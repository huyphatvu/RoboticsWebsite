class CreateRefData < ActiveRecord::Migration[5.2]

  def change
    create_table :ref_data do |t|
      t.integer :page_num
      t.string :label
      t.timestamps
    end
  end
end
