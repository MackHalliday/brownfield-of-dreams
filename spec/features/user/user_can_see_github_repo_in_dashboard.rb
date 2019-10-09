require 'rails_helper'

describe 'User Dashboard' do
  it 'can display GitHub repos' do
    # skip
  # As a logged in user
  # When I visit /dashboard
  # Then I should see a section for "Github"
  # And under that section I should see a list of 5 repositories
  #   with the name of each Repo linking to the repo on Github
  json_response = File.open('./fixtures/git_hub_data.json')
    stub_request(:get, "https://api.github.com/user/repos")
    .to_return(status: 200, body: json_response)

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    visit '/'

    click_on 'Sign In'


    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'


    expect(page).to have_css("#user-#{user.id}-github-repositories")
      within "#user-#{user.id}-github-repositories" do
        # expect(page).to have_css("#github-repository-#{repo_1.id}")
        # expect(page).to have_css("#github-repository-#{repo_2.id}")
        # expect(page).to have_css("#github-repository-#{repo_3.id}")
        # expect(page).to have_css("#github-repository-#{repo_4.id}")
        # expect(page).to have_css("#github-repository-#{repo_5.id}")
      end
  end
end
