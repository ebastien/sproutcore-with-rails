module MediaSupport

  API_MIME = Mime::DSIM
  
  API_DEFAULT_ENV = {
    'CONTENT_TYPE' => API_MIME.to_s,
    'HTTP_ACCEPT'  => API_MIME.to_s
  }
  
  attr_accessor :document
  
  def decode!
    self.document = JSON.parse(response.body)
  end
  
  def link(rel)
    lnk = JsonPath.on(document, '$..links').flatten.select { |l| l['rel'] == rel }.first
    lnk && lnk['href']
  end
  
end 
