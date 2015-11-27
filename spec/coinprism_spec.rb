require 'helper'

describe Coinprism do
  ADDRESS = "akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19"
  ASSET_ID = "AdjonhsTtUxo26WhFk1LxayXNUZa7jkszX"
  TX = "381cfbe83caaf96bf54132c89ff1408f36012442cee807496c3626e5ad6b14da"
  it "has a version" do
    expect(Coinprism::VERSION).to eq("1.0.0")
  end

  describe "addresses" do
    describe "#address_info" do
      it 'brings back an ostruct' do
        VCR.use_cassette("address") do
          response = Coinprism.address_info(ADDRESS)

          expect(response.class).to eq(OpenStruct)
          expect(response.balance).to eq(5010000)
        end
      end

      it 'returns expected fields' do
        VCR.use_cassette("address") do
          expect(Coinprism.address_info(ADDRESS).to_h).to eq(
            {
              :address=>ADDRESS,
              :asset_address=>ADDRESS,
              :bitcoin_address=>"1L7jnZWnbfLeLim4uGjY4haYx4u1wgvX6e",
              :issuable_asset=>"AHWxTjWHDyJVSnSKjHdiyPMmkrEzRB3aWV",
              :balance=>5010000,
              :unconfirmed_balance=>0,
              :assets=>[]
            })
        end
      end
    end

    describe "#transactions" do
      it 'returns expected fields' do
        VCR.use_cassette("address_transactions") do
          res = Coinprism.transactions(ADDRESS)
          expect(res.length).to eq(5)
          expect(res.first).to eq(
            {
              "hash"=>"96bc326926a33914659682d55bd341312d4cfc522f3b878cc301544fec4d7ced",
              "block_hash"=>"000000000000000007a2e4e81816293a6907fd8f3b5e43fff2cfd297b066236f",
              "block_height"=>384208,
              "block_time"=>"2015-11-18T21:18:39.0000000Z",
              "inputs"=>[
                {
                  "transaction_hash"=>"96bc326926a33914659682d55bd341312d4cfc522f3b878cc301544fec4d7ced",
                  "output_hash"=>"84beda5f57249d1c7f2930321f6a62adc04e5875f30a07863a0872fbcc6f4adc",
                  "output_index"=>0,
                  "value"=>1000000,
                  "addresses"=>["1GGgiEKeYv9uiemq7CGNjf5hLVZozM4uB9"],
                  "script_signature"=>"483045022100d4da55c82cce5e9869f51afc0eecfd5003150e4a46e2424b320ae77e1d5530a2022025451704d011a682fb3a36c13a72d265edd90c9f32c1de331e1c323e1c332d7f0121029ee23889296dbea499687a132b8853d32ac1688701d5a9096fd1d38147abe1d7",
                  "asset_id"=>nil,
                  "asset_quantity"=>nil
                }
              ],
              "outputs"=>[
                {
                  "transaction_hash"=>"96bc326926a33914659682d55bd341312d4cfc522f3b878cc301544fec4d7ced",
                  "index"=>0,
                  "value"=>600,
                  "addresses"=>["1MK9RVVA9Pc5vgZA3J9azshSNfdugZJmbL"],
                  "script"=>"76a914ded10895e26b97074c66381c6acbb7eda26ac10788ac",
                  "asset_id"=>"ALc63gPmwCaUVKxG843Lm6a4CWgGiskpQV",
                  "asset_quantity"=>"98"
                },
                {
                  "transaction_hash"=>"96bc326926a33914659682d55bd341312d4cfc522f3b878cc301544fec4d7ced",
                  "index"=>1,
                  "value"=>0,
                  "addresses"=>[],
                  "script"=>"6a074f410100016200",
                  "asset_id"=>nil,
                  "asset_quantity"=>nil
                },
                {
                  "transaction_hash"=>"96bc326926a33914659682d55bd341312d4cfc522f3b878cc301544fec4d7ced",
                  "index"=>2,
                  "value"=>980000,
                  "addresses"=>["1L7jnZWnbfLeLim4uGjY4haYx4u1wgvX6e"],
                  "script"=>"76a914d1b099e9af7b167141bd7da63b595819d3b62c3088ac",
                  "asset_id"=>nil,
                  "asset_quantity"=>nil
                  },
                  {
                    "transaction_hash"=>"96bc326926a33914659682d55bd341312d4cfc522f3b878cc301544fec4d7ced",
                    "index"=>3,
                    "value"=>9400,
                    "addresses"=>["1MK9RVVA9Pc5vgZA3J9azshSNfdugZJmbL"],
                    "script"=>"76a914ded10895e26b97074c66381c6acbb7eda26ac10788ac",
                    "asset_id"=>nil,
                    "asset_quantity"=>nil
                  }],
                  "amount"=>990000,
                  "fees"=>10000,
                  "confirmations"=>1321
                }
          )
        end
      end
    end
    describe "#unspents" do
      it 'returns expected fields' do
        VCR.use_cassette("unspents") do
          res = Coinprism.unspents(ADDRESS)
          expect(res.length).to eq(4)
          expect(res.first).to eq(
            {
              "transaction_hash"=>"b3d7e02ac16dba720cda30d489a41b8f7352a8d2c03808433084f4084dfdf921",
              "output_index"=>1,
              "value"=>3979400,
              "asset_id"=>nil,
              "asset_quantity"=>nil,
              "addresses"=>["1L7jnZWnbfLeLim4uGjY4haYx4u1wgvX6e"],
              "script_hex"=>"76a914d1b099e9af7b167141bd7da63b595819d3b62c3088ac",
              "spent"=>false,
              "confirmations"=>1329}
          )
        end
      end
    end
  end

  describe "transactions" do
    describe "#transaction_info" do
      it 'returns expected fields' do
        VCR.use_cassette("transaction_info") do
          resp = Coinprism.transaction_info(TX)
          expect(resp.to_h).to eq(
                {
                  :hash=>"381cfbe83caaf96bf54132c89ff1408f36012442cee807496c3626e5ad6b14da",
                  :block_hash=>"000000000000000002c9e3352034631ad5815990393472b222b8a8916c3a5dab", :block_height=>378360, :block_time=>"2015-10-11T02:13:05.0000000Z", :inputs=>[{"transaction_hash"=>"381cfbe83caaf96bf54132c89ff1408f36012442cee807496c3626e5ad6b14da", "output_hash"=>"c6a8b7a922a146c63a0c206a19004bddc3cb290989b1086df3574702f4204bde", "output_index"=>0, "value"=>5000000, "addresses"=>["16hUPYinZcWZtRLfiw87FBss3AAjkgXJCh"], "script_signature"=>"493046022100dfb247facedc42d4af54cd827f06ae172c533cd2e07ce5c452fc3b41a9024c680221009a266750bbac6b0cecc237d2b9231ddc048e04de4c3a758338290f1a2e0ed12101210305a3dd952ea1361009857be1a7ec4416026cbc5bab755385ccca313a8cd37043", "asset_id"=>nil, "asset_quantity"=>nil}], :outputs=>[{"transaction_hash"=>"381cfbe83caaf96bf54132c89ff1408f36012442cee807496c3626e5ad6b14da", "index"=>0, "value"=>600, "addresses"=>["12ULoRSnhDycdJnoZ6kuvYDjirdgteNbWx"], "script"=>"76a9141023e2a0f6275131ee05819b58261752ebfb989a88ac", "asset_id"=>"ALXukPZvZJL3qDZkga2DwcbwS1P3pmyB8f", "asset_quantity"=>"5"}, {"transaction_hash"=>"381cfbe83caaf96bf54132c89ff1408f36012442cee807496c3626e5ad6b14da", "index"=>1, "value"=>0, "addresses"=>[], "script"=>"6a074f410100010500", "asset_id"=>nil, "asset_quantity"=>nil}, {"transaction_hash"=>"381cfbe83caaf96bf54132c89ff1408f36012442cee807496c3626e5ad6b14da", "index"=>2, "value"=>4989400, "addresses"=>["1DdFnKtfxomnpiw7bLsmGUh2wsz79pmCTc"], "script"=>"76a9148a7cd2af34908f474372c27dd386b2eac6c6478988ac", "asset_id"=>nil, "asset_quantity"=>nil}], :amount=>4990000, :fees=>10000, :confirmations=>7170}
              )
        end
      end
    end
  end

  describe "assets" do
    describe "#asset_definition" do
      it 'returns expected fields' do
        VCR.use_cassette("asset_definition") do
          resp = Coinprism.asset_definition(ASSET_ID)
          expect(resp.asset_id).to eq(ASSET_ID)
          expect(resp.name_short).to eq "GHX"
        end
      end
    end

    describe "#asset_owners" do
      it 'returns expected fields' do
        VCR.use_cassette("asset") do
          resp = Coinprism.asset_owners(ASSET_ID)
          expect(resp.block_height).to eq(385527)
          expect(resp.asset_id).to eq(ASSET_ID)
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
