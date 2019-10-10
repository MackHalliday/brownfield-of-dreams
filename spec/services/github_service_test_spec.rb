require 'rails_helper'

describe 'Github API service' do
  it "User Github Data", :vcr do

    user = create(:user, github_token: ENV["GITHUB_API_KEY"])

    service = GithubApiService.new

    raw_data = service.get_user_data(user)
    binding.pry

    expect(service).to be_a(GithubApiService)
    expect(raw_data).to be_a(Array)

    expect(raw_data.first).to have_key(:name)
    expect(raw_data.first).to have_key(:html_url)
  end
end
