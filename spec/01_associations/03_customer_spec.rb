describe Customer do
  let(:customer) { Customer.first }

  before do
    shack = Restaurant.create(name: "Karen's Lobster Shack", price: 1)
    baby_spice = Customer.create(first_name: "Emma", last_name: "Bunton")
    Review.create(restaurant: shack, customer: baby_spice, star_rating: 5)
  end

  it "has a first_name and a last_name" do
    expect(customer).to have_attributes(first_name: "Emma", last_name: "Bunton")
  end

  describe "#reviews" do
    it "returns the Review instances for this Customer" do
      expect(customer.reviews).to include(Review.first)
    end
  end

  describe "#restaurants" do
    it "returns the Restaurant instances for this Customer" do
      expect(customer.restaurants).to include(Restaurant.first)
    end
  end
end