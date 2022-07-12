class AddExpiryDateToShortUrlData < ActiveRecord::Migration[7.0]
  def up
    add_column :short_url_data, :expiry_date, :datetime
  end

  def down
    remove_column :short_url_data, :expiry_date
  end
end
