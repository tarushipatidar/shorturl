class CreateTrackShortUrl < ActiveRecord::Migration[7.0]
  def up
    create_table :track_short_urls do |t|
      t.integer :short_url_data_id
      t.string :id_addr
      t.string :country

      t.timestamps
    end
  end

  def down
    drop_table :track_short_urls
  end
end
