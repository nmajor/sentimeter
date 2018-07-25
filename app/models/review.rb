class Review < ApplicationRecord
  belongs_to :organization
  enum sentiment: [ :positive, :neutral, :negative, :mixed ]

  scope :positive, -> { where(sentiment: :positive) }
  scope :nutural, -> { where(sentiment: :nutural) }
  scope :negative, -> { where(sentiment: :negative) }

  def self.new_from_tweet(tweet)
    self.new(
      from: "twitter",
      remote_id: tweet.id,
      remote_created_at: tweet.created_at,
      text: tweet.text,
      source: {
        created_at: tweet.created_at,
        id: tweet.id,
        text: tweet.text,
        lang: tweet.lang,
        user: {
          name: tweet.user.name,
          screen_name: tweet.user.screen_name,
          profile_image_url: tweet.user.profile_image_url_https,
        },
      },
    )
  end

  def self.unanalyzed
    self.where(sentiment: nil)
  end

  def analyse

  end
end
