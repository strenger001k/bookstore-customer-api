class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
