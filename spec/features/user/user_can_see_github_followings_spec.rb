require 'rails_helper'

describe 'User Dashboard' do
  it 'displays github user following' do

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    json_following_response = File.open('./spec/fixtures/github_following_data.json')

    stub_request(:get, "https://api.github.com/user/following")
      .to_return(status: 200, body: json_following_response)

    json_repo_response = File.open('./spec/fixtures/github_data.json')

    stub_request(:get, "https://api.github.com/user/repos")
    .to_return(status: 200, body: json_repo_response)

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_css(".github-following")

    within ".github-following" do
      expect(page).to have_link("alect47")
      expect(page).to have_link("corneliusellen")
      expect(page).to have_link("shaviland")
      expect(page).to have_link("Kate-v2")
      expect(page).to have_link("markmahowald")
    end
  end
end
