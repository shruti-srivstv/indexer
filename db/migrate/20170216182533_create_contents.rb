class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :content_type
      t.text :data
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
