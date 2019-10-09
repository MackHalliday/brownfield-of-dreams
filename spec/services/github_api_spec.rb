require 'rails_helper'

describe "GitHub API Service" do
  it "User GitHub Data", :vcr do

    service = GithubApiService.new

    raw_data = service.get_user_data

    expect(service).to be_an_instance_of(GithubApiService)
    expect(raw_data).to be_an Array

    expect(raw_data.first).to have_key(:name)
    expect(raw_data.first).to have_key(:html_url)
  end
end
