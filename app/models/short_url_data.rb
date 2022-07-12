class ShortUrlData < ActiveRecord::Base
  validates :real_url, presence: true, allow_nil: false, uniqueness: true, format: { with: URI::regexp(%w[http https]) }, length: { minimum: 41 }
  validates :short_url, presence: true, allow_nil: false, uniqueness: true

  has_many :track_short_urls
end
