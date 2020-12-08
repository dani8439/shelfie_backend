class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.references :book, foreign_key: true
      t.text :quote

      t.timestamps
    end
  end
end
