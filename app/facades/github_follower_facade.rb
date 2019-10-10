class GithubFollowerFacade
  attr_reader :service

  def initialize(current_user)
    @service = GithubApiService.new
    @current_user = current_user
  end

  def all_follower_data
    @service.get_user_follower_data(@current_user).map do |d|
      Follower.new(d)
    end
  end

  def limit_follower_5
    all_follower_data[0..4]
  end

  def follower_data
    limit_follower_5
  end
end
