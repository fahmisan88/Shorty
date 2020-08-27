require 'rails_helper'

RSpec.describe "Link redirection", type: :request do

  it "redirects to the original url when given short link" do
    link = Link.create(
      url: "https://www.alongurlwebsite.com/articles/how-to-shorten-links",
    )
    get link.shortened_url
    expect(response).to redirect_to(link.url)
  end
end
