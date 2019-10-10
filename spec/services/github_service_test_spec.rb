require 'rails_helper'

describe 'github api service' do
  it "user github repo data", :vcr do

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    service = GithubApiService.new

    raw_data = service.get_user_repo_data(user)

    expect(service).to be_a(GithubApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:name)
    expect(raw_data.first).to have_key(:html_url)
  end

  it "user github following data", :vcr do

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    service = GithubApiService.new

    raw_data = service.get_user_following_data(user)

    expect(service).to be_a(GithubApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:login)
    expect(raw_data.first).to have_key(:html_url)
  end
end
