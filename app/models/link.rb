class Link < ApplicationRecord
  validates_presence_of :url, :slug
  validates_uniqueness_of :slug
end
