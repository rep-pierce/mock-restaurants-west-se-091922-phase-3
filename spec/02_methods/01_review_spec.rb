describe Review do
  let(:review) { Review.first }

  before do
    shack = Restaurant.create(name: "Karen's Lobster Shack", price: 1)
    baby_spice = Customer.create(first_name: "Emma", last_name: "Bunton")
    Review.create(restaurant: shack, customer: baby_spice, star_rating: 5)
  end

  describe "#full_review" do
    it "returns the foratted review" do
      expect(review.full_review).to eq(
        "Review for Karen's Lobster Shack by Emma Bunton: 5 stars."
      )
    end
  end
end