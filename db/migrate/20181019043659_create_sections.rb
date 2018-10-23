class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.references :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
