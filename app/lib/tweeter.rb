class Tweeter
  def search(query, since_id=nil)
    # https://www.rubydoc.info/gems/twitter/Twitter/REST/Search
    client.search(query, result_type: "recent", since_id: since_id)
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end
