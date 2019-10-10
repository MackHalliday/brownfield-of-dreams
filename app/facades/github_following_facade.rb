class GithubFollowingFacade
  attr_reader :service

  def initialize(current_user)
    @service = GithubApiService.new
    @current_user = current_user
  end

  # refactor to split method
  def following_data
    @service.get_user_following_data(@current_user).map do |following_hash|
      Following.new(following_hash)
    end
  end
end
