class GithubApiService

  def get_user_repo_data(user)
    json_response = conn(user).get("user/repos")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def get_user_following_data(user)
    json_response = conn(user).get("user/following")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn(user)
    Faraday.new(
      url: 'https://api.github.com/',
      headers: {'Authorization' => "token #{user.github_token}"}
    )
  end
end
