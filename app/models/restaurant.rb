class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def all_reviews
        self.reviews.each do |review|
            puts review[:star_rating]
        end
    end
end