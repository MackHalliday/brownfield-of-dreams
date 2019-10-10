require 'rails_helper'

describe 'User Dashboard' do
  it 'displays Github repos' do
    skip
    json_response = File.open('./spec/fixtures/github_following_view_data.json')

    stub_request(:get, "https://api.github.com/user/repos")
      .to_return(status: 200, body: json_response)

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    expect(page).to have_css(".github-following")

    within ".github-following" do
      expect(page).to have_link("following_1")
      expect(page).to have_link("following_2")
      expect(page).to have_link("following_3")
      expect(page).to have_link("following_4")
      expect(page).to have_link("following_5")
    end
  end
end
