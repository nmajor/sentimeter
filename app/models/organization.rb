class Organization < ApplicationRecord
  belongs_to :category
  has_many :reviews

  # TODO: Add logo image

  def twitter_query
    keywords.join(' OR ')
  end

  def last_review
    reviews.order('remote_id DESC').limit(1).first
  end
end
