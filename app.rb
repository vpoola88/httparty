require 'sinatra'
require 'json'

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"

  hello_world
  
end 


def hello_world
  p "$" * 100
  puts "helo world"
  p "$" * 100
end