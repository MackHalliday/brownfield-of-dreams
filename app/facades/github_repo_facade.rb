class GithubRepoFacade
  attr_reader :service
  def initialize(current_user)
    @service = GithubApiService.new
    @user = current_user
  end

  def raw_repo_data
    @service.get_user_data(@user)
  end

  def create_repo_objects
    raw_repo_data.map do |repo_hash|
      Repo.new(repo_hash)
    end
  end

  def repo_data
    create_repo_objects[0,5]
  end
end
