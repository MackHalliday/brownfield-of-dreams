class GithubApiService

  def get_user_data
    json_response = conn.get("user/repos")
    parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    # member_data = parsed_data[:results]
  end


  private
  def conn
  Faraday.new(
    url: 'https://api.github.com/',
    headers: {'Authorization' => "token #{ ENV["GITHUB_API_KEY"]}"}
    )
  end
end
