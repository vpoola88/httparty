## write a method to test the webhook
  # http://webhooks.us/
  # https://cookieshq.co.uk/posts/how-to-receive-webhooks-in-your-ruby-on-rails-application/
  # https://sendgrid.com/blog/simple-webhook-testing-using-sinatra-ngrok/

  ## test that we are getting a webhook, use a fake one that sents to json server locally ?

## get webhook parameters using HTTParty
  ## get user name or user info

## prase sample json using that
  ## how to test json parse? - test that it is json, test that it has a survey?


# get '/webhook/talent/predictive_survey' do
#   params
#   survey _results = HTTParty.get("api.talent.com/user_id=$params[:user_id]")
#   # parse survey results, decide the course that best fits (out of 6)
# end


# 1) catch a webhook
# 2) access the talentLMS api
#   - get survey results for a user
# 3) analyze the survey results and pick an optimal course
# 4) access the talentLMS api and assign the course to the user


# USE POSTMAN for manual testing of the webhook (and sending a payload)


