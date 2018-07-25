class Comprehend
  def batch_sentiment(text_list)
    client.batch_detect_sentiment(text_list: text_list, language_code: :en)
  end

  def client
    @client ||= Aws::Comprehend::Client.new(
      credentials: Aws::Credentials.new(
        ENV['AWS_COMPREHEND_ACCESS_KEY_ID'],
        ENV['AWS_COMPREHEND_SECRET_ACCESS_KEY']
      )
    )
  end
end
