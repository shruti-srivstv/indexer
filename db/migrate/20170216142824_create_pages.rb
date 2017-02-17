class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :url, :null => false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
