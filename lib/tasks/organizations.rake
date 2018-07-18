namespace :organizations do
  desc "Updates organization reviews and scores"
  task update_reviews: :environment do
    Organization.all.each do |organization|
      organization.update(reviews_updated_at: Time.now)

      q = organization.twitter_query
      # Get twitter results details
    end
  end
end
