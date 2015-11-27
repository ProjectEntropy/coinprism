require 'helper'

describe CoinPrism do
  it "has a version" do
    expect(CoinPrism::VERSION).to eq("1.0.0")
  end

  describe "addresses" do
    describe "#address_info" do
      it 'brings back an ostruct' do
        VCR.use_cassette("address") do
          response = Coinprism.address_info("akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19")

          expect(response.class).to eq(OpenStruct)
          expect(response.balance).to eq(5010000)
        end
      end

      it 'returns expected fields' do
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
    end

  end

  describe "assets" do
    describe "#asset_owners" do
      it 'returns expected fields' do
        VCR.use_cassette("asset") do
          resp = Coinprism.asset_owners("AdjonhsTtUxo26WhFk1LxayXNUZa7jkszX")
          expect(resp.block_height).to eq(385527)
          expect(resp.asset_id).to eq("AdjonhsTtUxo26WhFk1LxayXNUZa7jkszX")
          expect(resp.owners.length).to eq(213)
          expect(resp.owners.first).to eq(
                {
                  "script"=>"76a914ee3c1e561b43b4522e1dacdeadf822dbf964d8ce88ac",
                  "address"=>"1NifqmDXjuoJzi6eGzL9cctDBo8WxNPCgo",
                  "asset_quantity"=>"26100"}
              )
        end
      end
    end
  end

  describe "#balance"
  describe "#balance"
  describe "#balance"
end
