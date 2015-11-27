module Coinprism
  COINPRIM = "https://api.coinprism.com/v1/"
  ADDRESS_URL = "addresses/"
  TX_URL      = "transactions/"
  ASSET_URL   = "assets/"

  # Address
  def self.address_info(address)
    client_get("#{COINPRIM}#{ADDRESS_URL}/#{address}")
  end

  def self.transactions(address)
    client_get("#{COINPRIM}#{ADDRESS_URL}/#{address}/transactions")
  end

  def self.unspents(address)
    client_get("#{COINPRIM}#{ADDRESS_URL}/#{address}/unspents")
  end

  # Transaction
  def self.transaction_info(tx)
    client_get("#{COINPRIM}#{TX_URL}/#{tx}")
  end

  # Asset
  def self.asset_owners(asset_id)
    client_get("#{COINPRIM}#{ASSET_URL}/#{asset_id}/owners")
  end


  private

  def self.client_get(url)
    begin
      response = RestClient.get(url)
    rescue RestClient::Exception => e
      raise e
    end
    json = JSON.parse(response.body)

    return OpenStruct.new(json) if json.is_a?(Hash)
    return json  # Sometimes just an array
  end
end
