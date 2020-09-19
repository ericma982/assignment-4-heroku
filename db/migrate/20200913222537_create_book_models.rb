class CreateBookModels < ActiveRecord::Migration[6.0]

  def up
    create_table :book_models do |t|
      t.string "title"
      t.string "author"
      t.string "genre"
      t.float "price"
      t.string "published_date"
      t.timestamps
    end
  end

    def down
      drop_table :book_models
    end
end
