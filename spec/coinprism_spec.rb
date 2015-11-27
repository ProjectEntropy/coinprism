require 'helper'

describe CoinPrism do
  it "has a version" do
    expect(CoinPrism::VERSION).to eq("1.0.0")
  end

  describe "address info" do
    it 'returns' do
      VCR.use_cassette("address") do
        expect(Coinprism.address_info("akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19").to_h).to eq(
          {
            :address=>"akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19",
            :asset_address=>"akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19",
            :bitcoin_address=>"1L7jnZWnbfLeLim4uGjY4haYx4u1wgvX6e",
            :issuable_asset=>"AHWxTjWHDyJVSnSKjHdiyPMmkrEzRB3aWV",
            :balance=>5010000,
            :unconfirmed_balance=>0,
            :assets=>[]
          })
      end
    end

    it 'brings back an ostruct' do
      VCR.use_cassette("address") do
        response = Coinprism.address_info("akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19")

        expect(response.class).to eq(OpenStruct)
        expect(response.balance).to eq(5010000)
      end
    end
  end
end
