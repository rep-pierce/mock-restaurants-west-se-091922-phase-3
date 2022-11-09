describe Review do
  let(:review) { Review.first }

  before do
    shack = Restaurant.create(name: "Karen's Lobster Shack", price: 1)
    baby_spice = Customer.create(first_name: "Emma", last_name: "Bunton")
    Review.create(restaurant: shack, customer: baby_spice, star_rating: 5)
  end

  it "has a star_rating" do
    expect(review).to have_attributes(star_rating: 5)
  end

  describe "#restaurant" do
    it "returns the Restaurant instance for this Review" do
      expect(review.restaurant).to eq(Restaurant.first)
    end
  end

  describe "#customer" do
    it "returns the Customer instance for this Review" do
      expect(review.customer).to eq(Customer.first)
    end
  end
end