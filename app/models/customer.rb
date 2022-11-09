class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    
    def favorite_restaurant
        best_rest = 0
        self.reviews.each do |review|
            if best_rest < review[:star_rating]
                best_rest = review[:star_rating]
            end
        end
        best_rest
    end
end