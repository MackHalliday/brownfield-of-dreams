class GithubRepoFacade
  attr_reader :service
  def initialize
    @service = GithubApiService.new
  end

  def raw_repo_data
    @service.get_user_data
  end

  def filter_name_url
    raw_repo_data.map do |data|
      {name: data[:name],
        html_url: data[:owner][:html_url] }
    end
  end

  def repo_data
    filter_name_url[0, 5]
  end
end
