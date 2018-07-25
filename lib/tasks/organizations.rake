namespace :organizations do
  desc "Fetches organization reviews from twitter"
  task fetch_tweets: :environment do
    Organization.all.each do |organization|
      puts "Fetching tweets for #{organization.name}"
      tweets = organization.fetch_tweets

      puts "Found #{tweets.to_a.size} tweets..."
      tweets.each do |tweet|
        review = Review.new_from_tweet(tweet)
        review.organization = organization

        unless review.save
          puts "Failed to save review from tweet"
          p tweet
          p review
          p review.errors.full_messages
        end
      end
    end
  end

  desc "Recalculates organization score"
  task recalculate_scores: :environment do
    Organization.all.each do |organization|
      organization.recalculate_score!
    end
  end
end
