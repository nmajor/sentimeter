namespace :organizations do
  desc "Updates organization reviews and scores"
  task update_reviews: :environment do
    Organization.all.each do |organization|
      p organization.update(reviews_updated_at: Time.now)

      q = organization.twitter_query
      tweets = Tweeter.new.search(q)

      tweets.each do |tweet|
        review = Review.new(
          organization: organization,
          from: "twitter",
          remote_id: tweet.id,
          remote_created_at: tweet.created_at,
          text: tweet.text,
          source: {
            created_at: tweet.created_at,
            id: tweet.id,
            text: tweet.text,
            lang: twee.lang,
            user: {
              name: tweet.user.name,
              screen_name: tweet.user.screen_name,
              profile_image_url: tweet.user.profile_image_url_https,
            },
          },
        )

        p review.save
      end
    end
  end
end
