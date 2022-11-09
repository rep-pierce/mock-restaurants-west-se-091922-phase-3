describe Restaurant do
  let(:customer) { Customer.first }
  let(:shack) { Restaurant.first }
  let(:bistro) { Restaurant.second }
  let(:palace) { Restaurant.third }

  before do
    shack = Restaurant.create(name: "Karen's Lobster Shack", price: 1)
    bistro = Restaurant.create(name: "Sanjay's Lobster Bistro", price: 2)
    palace = Restaurant.create(name: "Kiki's Lobster Palace", price: 3)
    baby_spice = Customer.create(first_name: "Emma", last_name: "Bunton")
    Review.create(restaurant: shack, customer: baby_spice, star_rating: 3)
    Review.create(restaurant: bistro, customer: baby_spice, star_rating: 5)
    Review.create(restaurant: palace, customer: baby_spice, star_rating: 1)
    Review.create(restaurant: palace, customer: baby_spice, star_rating: 2)
  end

  describe ".fanciest" do
    it "returns the restaurant instance for the restaurant that has the highest price" do
      expect(Restaurant.fanciest).to eq(palace)
    end
  end

  describe "#all_reviews" do
    it "return an Array of strings with all the reviews for this restaurant" do
      expect(palace.all_reviews).to eq(
        [
          "Review for Kiki's Lobster Palace by Emma Bunton: 1 stars.",
          "Review for Kiki's Lobster Palace by Emma Bunton: 2 stars."
        ]
      )
    end
  end
end
