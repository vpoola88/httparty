require 'sinatra'
require "dotenv"
  Dotenv.load
require 'json'
require 'pry'
require 'httparty'
require 'uri'
require 'net/http'



post '/payload' do

  if status 200
    payload = JSON.parse(request.body.read)

    currentUserId = payload["currentUserId"]
    currentUnitId = payload["currentUnitId"]

    u = TalentLMSUserSurvey.new(currentUserId, currentUnitId)
    u.get_talentlms_api_data
    u.assign_survey
  else
    puts "You have not yet taken the Predictive Survey"
  end

end

class TalentLMSUserSurvey


  def initialize(currentUserId, currentUnitId)
    @currentUserId = currentUserId
    @currentUnitId = currentUnitId
  end

  def talentlms_url
    "https://wisdomlabs.talentlms.com/api/v1/gettestanswers/test_id:#{@currentUnitId},user_id:#{@currentUserId}"
  end

  def get_talentlms_api_data

    auth = {:username => ENV['username'], :password => ""}
    response = HTTParty.get(talentlms_url, :basic_auth => auth)
    parsed_response  = JSON.parse(response)


    if parsed_response.key?("error")
      @survey_answers = "nil"
    else
      @survey_answers = parsed_response["questions"].first["user_answers"]
    end

  end

  def assign_survey

    # "answers"=>{"1"=>"Managing Stress", "2"=>"Staying Focused", "3"=>"Bouncing Back after Setbacks", "4"=>"Relating with Co-workers", "5"=>"Managing Emotions", "6"=>"Boosting Creativity"},
    if @survey_answers == "nil"
      puts "user has not taken survey yet"
    else
      if @survey_answers.keys.first == "1"
        url = URI("https://wisdomlabs.talentlms.com/api/v1/addusertocourse")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'multipart/form-data; boundary=---011000010111000001101001'
        request["authorization"] = 'Basic R3p1Y1VoV05ldkluQlBONENWeGwxejFYTmNJV0RQOg=='
        request["cache-control"] = 'no-cache'
        request["postman-token"] = '2ed789e5-880e-9f15-8d11-4a0b1ec6905f'
        request.body = "-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"user_id\"\r\n\r\n28\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"course_id\"\r\n\r\n152\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"role\"\r\n\r\nlearner\r\n-----011000010111000001101001--"

        response = http.request(request)
        puts response.read_body
      else
        puts "what what??"
      end
    end

  end

end