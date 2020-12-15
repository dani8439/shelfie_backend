class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.references :book, null: false, foreign_key: true
      t.text :quote
      #should I change from quote to passage? lines? confusion later on.

      t.timestamps
    end
  end
end
