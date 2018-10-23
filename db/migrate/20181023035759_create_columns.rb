class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :title
      t.string :width
      t.references :section, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
