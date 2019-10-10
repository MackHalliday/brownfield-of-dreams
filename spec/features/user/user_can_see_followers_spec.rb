require 'rails_helper'

describe 'User Dashboard' do
  it 'displays Github followers' do

    json_response = File.open('./spec/fixtures/github_follower_data.json')

    stub_request(:get, "https://api.github.com/user/followers")
    .to_return(status: 200, body: json_response)

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    visit '/'

    click_on 'Sign In'

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(page).to have_css(".github-followers")

    within ".github-followers" do
      expect(page).to have_link("MackHalliday")
      expect(page).to have_link("shaviland")
      expect(page).to have_link("markmahowald")
    end

    # click_link("repo_1")
    # expect(current_path).to eq("https://github.com/alect47/a")
  end
end
