class Organization < ApplicationRecord
  belongs_to :category

  # TODO: Add logo image

  def twitter_query
    keywords.join(' OR ')
  end
end
