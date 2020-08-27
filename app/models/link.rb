class Link < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :slug
  validate :url_format
  before_create :generate_slug

  def url_format
    uri = URI.parse(url)
    errors.add(:url, "Invalid URL format") if uri.host.nil?
  end

  def shortened_url
    "http://localhost:3000/#{slug}"
  end

  private

  def generate_slug
    self.slug = SecureRandom.hex(3)

    while Link.exists?(slug: self.slug)
      self.slug = SecureRandom.hex(3)
    end
  end
end
