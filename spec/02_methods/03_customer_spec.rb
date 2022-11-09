describe Customer do
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

  describe "#full_name" do
    it "returns the full name of the customer" do
      expect(customer.full_name).to eq("Emma Bunton")
    end
  end

  describe "#favorite_restaurant" do
    it "returns the restaurant instance that has the highest star rating from this customer" do
      expect(customer.favorite_restaurant).to eq(bistro)
    end
  end

  describe "#add_review" do
    it "creates a new review for the restaurant" do
      expect { customer.add_review(bistro, 5) }.to change(customer.reviews, :count).by(1)
    end
  end

  describe "#delete_reviews" do
    it "removes all the customer's reviews for the given restaurant" do
      expect { customer.delete_reviews(palace) }.to change(customer.reviews, :count).by(-2)
    end
  end

end
