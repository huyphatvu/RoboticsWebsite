class CreateResources < ActiveRecord::Migration[5.2]

  def change
    create_table :resources do |t|
      t.string :experiment_name
      t.string :experiment_url
      t.timestamps
    end
  end
end
