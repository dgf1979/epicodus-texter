class Wiki

  def self.search(search_for)
    RestClient.log = 'log/rest-client.log'
    request = RestClient::Request.new(
     :method => :get,
     :url => "https://en.wikipedia.org/w/api.php?",
     :payload => { :action => 'query',
                   :list => 'search',
                   :format => 'json',
                   :srsearch => search_for
                   })

    response = request.execute
    return response
  end

end
