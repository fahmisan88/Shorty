require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  url = "https://www.alongurlwebsite.com/articles/how-to-shorten-links"
  link_params = {url: url}
  let(:link) { Link.create(link_params) }

  it 'creates a new short link' do
    expect(link.persisted?).to be(true)
    expect(link.url).to eq(url)
    expect(link.slug).to be_truthy
  end
end
