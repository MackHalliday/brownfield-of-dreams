require 'rails_helper'

describe GithubRepoFacade do
  it 'initializes' do
    facade = GithubRepoFacade.new

    expect(facade).to be_an_instance_of(GithubRepoFacade)
  end

  it 'initializes GithubApiService' do
    facade = GithubRepoFacade.new

    expect(facade.service).to be_an_instance_of(GithubApiService)
  end

  it 'can return github repo data' do
    facade = GithubRepoFacade.new

    json_response = File.open('./fixtures/git_hub_data.json')
      stub_request(:get, "https://api.github.com/user/repos")
      .to_return(status: 200, body: json_response)

    data = facade.repo_data

    expect(data).to be_a Array
    expect(data.count).to eq(5)
    expect(data[0]).to have_key(:name)
    expect(data[0]).to have_key(:html_url)
  end
end
