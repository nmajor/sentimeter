namespace :reviews do
  desc "Performs sentiment analysis on new unanalyzed reviews"
  task analyze: :environment do
    Review.unanalyzed.in_groups_of(25) do |reviews_group|
      reviews_group.compact!

      sentiment_results = Comprehend.new.batch_sentiment(reviews_group.pluck(:text))
      reviews_group.each_with_index do |review, index|
        result = sentiment_results.result_list[index]
        review.sentiment = result.sentiment.downcase.to_sym
        review.full_sentiment = result.to_hash

        unless review.save
          puts "Failed to save review from tweet"
          p result
          p review
          p review.errors.full_messages
        end
      end
    end
  end
end
