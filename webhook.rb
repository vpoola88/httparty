require 'open-uri'
require 'net/http'

url = "https://hooks.slack.com/services/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"
uri = URI(url)
req = Net::HTTP::Post.new(uri)

req.body = "{'text':'test'}"
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
res.body # contains the response body


# POST --data-urlencode 'payload={"channel": "#webhook-test", "username": "webhookbot", "text": "This is posted to #webhook-test and comes from a bot named webhookbot. this is a new message", "icon_emoji": ":ghost:"}'