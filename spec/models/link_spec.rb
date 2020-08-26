require 'rails_helper'

RSpec.describe Link, type: :model do

  it "is valid if it has an URL and a slug" do
    link = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-shorten-links",
      slug: "ABC1234"
    )
    expect(link.valid?).to be(true)
  end

  it "is invalid if it does not have URL" do
    link = Link.new(
      slug: "ABC1234"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if it does not have slug" do
    link = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-shorten-links"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if the slug has already exist" do
    link_1 = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-shorten-links",
      slug: "ABC1234"
    )
    link_1.save

    link_2 = Link.new(
      url: "https://www.alongurlwebsite.com/articles/how-to-code-in-ruby",
      slug: "ABC1234"
    )
    expect(link_2.valid?).to be(false)
  end
end
