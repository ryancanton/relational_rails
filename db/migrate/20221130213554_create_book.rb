class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :pages
      t.boolean :fiction
      t.timestamps
    end
  end
end
