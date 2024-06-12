require 'json'

def lambda_handler(event:, context:)
    event = JSON.generate(event)
    visitor = event["visitor"] || "stranger"
    {message: "Hello, #{visitor}"}
end