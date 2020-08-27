require 'rails_helper'

RSpec.describe Link, type: :model do

  it "is valid if it has the right URL format" do
    link = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-shorten-links",
      slug: "ABC123"
    )
    expect(link.valid?).to be(true)
  end

  it "is invalid if it does not have the right URL format" do
    link = Link.new(
      url: "alongurlwebsite.com/articles/how-to-shorten-links",
      slug: "ABC123"
    )
    expect(link.valid?).to be(false)
  end

  it "should always have unique slugs" do
    link_1 = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-shorten-links"
    )
    link_1.save

    link_2 = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-code-in-ruby",
      slug: "ABC123"
    )
    expect(link_2.valid?).to be(true)
  end
end
