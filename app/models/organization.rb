class Organization < ApplicationRecord
  belongs_to :category
  has_many :reviews

  # TODO: Add logo image

  def twitter_query
    keywords.join(' OR ') + " -from:#{twitter_screen_name}"
  end

  def last_review
    reviews.order('remote_id DESC').limit(1).first
  end

  def fetch_tweets
    since_id = self.last_review ? self.last_review.remote_id : nil
    Tweeter.new.search(twitter_query, since_id: since_id)
  end

  def recalculate_score
    negative_score = reviews.negative.count.to_f
    neutral_score = reviews.neutral.count.to_f
    positive_score = reviews.positive.count.to_f

    total = positive_score + negative_score

    self.score = (positive_score / total)
  end

  def recalculate_score!
    recalculate_score
    save
  end
end
