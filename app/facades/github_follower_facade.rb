class GithubFollowerFacade
  attr_reader :service

  def initialize(current_user)
    @service = GithubApiService.new
    @current_user = current_user
  end

  def all_follower_data
    @service.get_user_follower_data(@current_user).map do |follower_data|
      Follower.new(follower_data)
    end
  end

  def following_data
    @service.get_user_following_data(@current_user).map do |d|
      Follower.new(d)
    end
  end

  def limit_follower_5
    all_follower_data[0..4]
  end

  # This method is unnecessary if we aren't limited number of followers displayed
  def follower_data
    all_follower_data
  end
end
