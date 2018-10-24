class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :content
      t.references :column, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
