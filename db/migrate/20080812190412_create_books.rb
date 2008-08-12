class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string  :author
      t.string  :title
      t.date    :published_on
      t.integer :items

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
