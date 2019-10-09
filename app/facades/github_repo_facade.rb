class GithubRepoFacade
  attr_reader :service
  def initialize
    @service = GithubApiService.new
  end

  def repo_data
    binding.pry
  end

  # def raw repo data
  # service.get_user_data
  # end

  #def filter
    #finds url and name
  # end

  #def present to view


end
