require 'faraday'

class Lyra
  @@api_url = 'https://lyra-api.herokuapp.com/api'
  @@api_key = ENV.fetch('LYRA_API_KEY')
  def initialize(noun)
    @conn = Faraday.new(
      :url => "#{@@api_url}/#{noun}/",
      :headers => {'Authorization': "Bearer #{@@api_key}"}
    )
  end

  def get(uuid=nil)
    if uuid
      response = @conn.get(uuid)
    else
      response = @conn.get()
    end
    json = JSON.parse(response.body)
    json["data"]
  end

  def post(args)
    response = @conn.post() do |req|
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(args)
    end
    json = JSON.parse(response.body)
    json["data"]
  end

  def patch(uuid, args)
    response = @conn.patch(uuid) do |req|
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = URI.encode_www_form(args)
    end
    json = JSON.parse(response.body)
    json["data"]
  end

  def delete(uuid)
    response = @conn.delete(uuid)
    json = JSON.parse(response.body)
    json["data"]
  end

end
