TrueIdentity::App.helpers do
  def json_request
    return @json_request if @json_request
    request
    request.body.rewind
    @json_request = JSON.parse(request.body.read, :symbolize_names => true)
    @json_request
  end

end