CoinPrism Ruby API
===
[![Build Status](https://img.shields.io/travis/ProjectEntropy/coinprism.svg)](https://travis-ci.org/ProjectEntropy/coinprism)
[![Code Climate](https://img.shields.io/codeclimate/github/ProjectEntropy/coinprism.svg)](https://codeclimate.com/github/ProjectEntropy/coinprism)
[![Dependency Status](https://img.shields.io/gemnasium/ProjectEntropy/coinprism.svg)](https://gemnasium.com/ProjectEntropy/coinprism)


Talk to the coin prism blockchain explorer and wallet API

## Quick start

Install via Rubygems

    gem install coinprism

... or add to your Gemfile

    gem "coinprism"


### Address info
```ruby
# Addresses
Coinprism.address_info("akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19")
  => #<OpenStruct address="1NifqmDXjuoJzi6eGzL9cctDBo8WxNPCgo", asset_address="akYgZ5w2sDPgzrxG1KcSLGUnnXQJgwr8CTE", bitcoin_address="1NifqmDXjuoJzi6eGzL9cctDBo8WxNPCgo", issuable_asset="AGY84vUEXzgnY2QSa4k7UBEq5j54DcEuqo", balance=8824131, unconfirmed_balance=0, assets=[{"id"=>"AbukVhn9rLxcYQmwd4FGWtjRDtWfodcQ3j", "balance"=>"26100", ... } ], ...>

Coinprism.transactions("akW5d2jL859ELCxvRwtqiiZV8Hg5Bx7Pu19")
  =>  [ {"hash"=>"dc04cbd2b74d22e23b594c2c40d9106e7d8e67c6ebfef4d64408ec11a0e0f2fe", "block_hash"=>"00000000000000000ef246c814f8cb8c1a26bc3c6cb1286bdbc5f4140ed3fc79", "block_height"=>385510, "block_time"=>"2015-11-26T22:14:11.0000000Z", ... } ]

Coinprism.unspents("1NifqmDXjuoJzi6eGzL9cctDBo8WxNPCgo")
  => [ {"transaction_hash"=>"863716f3a8277556b9abbe58ae33d2980c92fca897708d07c82ad3bb85756565", "output_index"=>173, "value"=>8792861, "asset_id"=>nil, "asset_quantity"=>nil, "addresses"=>["1NifqmDXjuoJzi6eGzL9cctDBo8WxNPCgo"], "script_hex"=>"76a914ee3c1e561b43b4522e1dacdeadf822dbf964d8ce88ac", "spent"=>false, "confirmations"=>35}, {"transaction_hash"=>"05a156d42fd94"}, ... } ]

```

### Transaction info
```ruby

# Transaction
Coinprism.transaction_info("863716f3a8277556b9abbe58ae33d2980c92fca897708d07c82ad3bb85756565")
  => #<OpenStruct hash="863716f3a8277556b9abbe58ae33d2980c92fca897708d07c82ad3bb85756565", block_hash="00000000000000000ef246c814f8cb8c1a26bc3c6cb1286bdbc5f4140ed3fc79", block_height=385510, block_time="2015-11-26T22:14:11.0000000Z", inputs=[{"transaction_hash"=>"863716f3a8277556b9abbe58ae33d2980c92fca897708d07c82ad3bb85756565", "output_hash"=>"34914f3edb499e7d87d9e89a3b16d9e8175a145e6f43760f5065003c92e85d5e", "output_index"=>1, "value"=>84301030, "addresses"=>["1NpmirYrxqLm1hbDe3BNWmb8dRu2NrXSWv"], ... >

```

### Asset info
```ruby
# Asset
Coinprism.asset_definition("ALXukPZvZJL3qDZkga2DwcbwS1P3pmyB8f")
  => #<OpenStruct asset_id="ALXukPZvZJL3qDZkga2DwcbwS1P3pmyB8f", metadata_url="https://goo.gl/lQ3zCO", final_metadata_url="https://buckchainstore.com/asset", verified_issuer=true, name="AlphaBuck", contract_url="http://www.buckchainstore.com/a-buck", name_short="A-BUCK", issuer="CN=www.buckchainstore.com, OU=PositiveSSL, OU=Domain Control Validated", description="", description_mime="text/x-markdown; charset=UTF-8", type="Other", divisibility=2, icon_url=nil, image_url=nil>

Coinprism.asset_owners("ALXukPZvZJL3qDZkga2DwcbwS1P3pmyB8f")
  => #<OpenStruct block_height=385547, asset_id="ALXukPZvZJL3qDZkga2DwcbwS1P3pmyB8f", owners=[{"script"=>"76a9141023e2a0f6275131ee05819b58261752ebfb989a88ac", "address"=>"12ULoRSnhDycdJnoZ6kuvYDjirdgteNbWx", "asset_quantity"=>"5"}]>


```


Contributing
------------
Please fork the repo to your own github account, make a new branch for your feature/changes and then make a pull request to have it merged back into this repo.

Credits
-------

Joran Kikke (@donkeyscience)
