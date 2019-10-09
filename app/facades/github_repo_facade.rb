class GithubRepoFacade
  attr_reader :service
  def initialize
    @service = GithubApiService.new
  end

  def repos_data
    raw_repo_data.fliter_name_url
  end

  def raw_repo_data
    service.get_user_data
  end

  def fliter_name_url
    binding.pry
  end



  #def present to view
 #
 # def github_api_service
 #    GithubApiService.new
 # end

end
