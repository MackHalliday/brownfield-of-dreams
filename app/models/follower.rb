class Follower
  attr_reader :login, :html_url

  def initialize(hash)
    @login = hash[:login]
    @html_url = hash[:html_url]
  end
end
