describe Restaurant do
  let(:restaurant) { Restaurant.first }

  before do
    shack = Restaurant.create(name: "Karen's Lobster Shack", price: 1)
    baby_spice = Customer.create(first_name: "Emma", last_name: "Bunton")
    Review.create(restaurant: shack, customer: baby_spice, star_rating: 5)
  end

  it "has a name and a price" do
    expect(restaurant).to have_attributes(name: "Karen's Lobster Shack", price: 1)
  end

  describe "#reviews" do
    it "returns the Review instances for this Restaurant" do
      expect(restaurant.reviews).to include(Review.first)
    end
  end

  describe "#customers" do
    it "returns the Customer instances for this Restaurant" do
      expect(restaurant.customers).to include(Customer.first)
    end
  end
end