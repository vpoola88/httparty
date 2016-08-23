require 'sinatra'
require 'json'
require 'pry'
require 'httparty'

  
post '/payload' do
  push = JSON.parse(request.body.read)
  binding.pry
  user = push['sender']['login']

  # data = {"currentUserId": currentUserId, }

  if status 200
    u = UserCommits.new(user)
    puts u.get_talentlms_api_data
  else

  end
end 

class UserCommits
  def initialize(username)
    @username = username
  end

  def github_url
    "https://api.github.com/users/#{@username}"
  end

  def get_talentlms_api_data
    response = HTTParty.get(github_url)
    data = JSON.parse(response.body)

    binding.pry
  end

end

