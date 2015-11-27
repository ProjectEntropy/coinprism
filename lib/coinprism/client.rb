module Coinprism
  COINPRIM = "https://api.coinprism.com/v1/"
  ADDRESS_URL = "addresses/"
  ASSET_URL = "assets/"

  def self.address_info(address)
    client_get("#{COINPRIM}#{ADDRESS_URL}/#{address}")
  end

  def self.balance(address)
    balance = address_info(address).balance
    Satoshi.new(balance, from_unit: :satoshi)
  end

  def self.asset_owners(asset_id)
    response = client_get("#{COINPRIM}#{ASSET_URL}/#{asset_id}/owners")
  end

  def self.client_get(url)
    response = RestClient.get(url)
    OpenStruct.new JSON.parse(response.body)
  end
end
