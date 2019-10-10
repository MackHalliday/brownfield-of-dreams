class Follower
  attr_reader :login, :url

  def initialize(hash)
    @login = hash[:login]
    @url = hash[:url]
  end
end
