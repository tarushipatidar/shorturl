class CreateShortUrlData < ActiveRecord::Migration[7.0]
  def up
    create_table :short_url_data do |t|
      t.text :real_url
      t.text :short_url
      t.integer :url_open_count, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :short_url_data
  end
end
