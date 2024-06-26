class CreateStorables < ActiveRecord::Migration[7.1]
  def change

    create_table :storables do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :storable, polymorphic: true

      t.timestamps
    end

    create_table :folders do |t|

      t.timestamps
    end

    create_table :files do |t|
      t.jsonb :file_data

      t.timestamps
    end

    add_reference :storables, :parent, foreign_key: { to_table: :folders }, null: true

  end
end
