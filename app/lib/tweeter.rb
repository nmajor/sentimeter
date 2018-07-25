class Tweeter
  def search(query, options={})
    # https://www.rubydoc.info/gems/twitter/Twitter/REST/Search
    client.search(query + ' exclude:retweets', result_type: "recent", since_id: options[:since_id], lang: :en)
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
