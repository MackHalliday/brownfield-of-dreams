class Following
  attr_reader :login, :html_url
  def initialize(following_hash)
    @login = following_hash[:login]
    @html_url = following_hash[:html_url]
  end
end
