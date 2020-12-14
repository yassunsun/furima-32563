class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title ,         null: false
      t.text       :explanation ,   null: false
      t.integer    :price ,         null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
