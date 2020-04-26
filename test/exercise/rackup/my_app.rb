Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  post '/hello' do
    [200, {}, ['Hello World post']]
  end
end
