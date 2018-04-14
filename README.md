# One Click Sign in for Outlook

A wrapper for Outlook that makes using OAuth2 for Outlook/Office365 easier. It is a REST API that returns the access token after logging into Outlook. It can be used for any framework/language. It is currently hosted at xxx.xxx.xxx.xxx

![alt text](https://github.com/KauNair/Outlook-Login/blob/master/diagram.png "image")

The access token can be accessed at xxx.xxx.xxx.xxx/api/v1

## Here's a simple code example using ruby

```ruby
#Gemfile

   gem 'httparty'
```

```ruby
   require 'httparty'

   response = HTTParty.get('xxx.xxx.xxx.xxx/api/v1')
   data = JSON.parse(response.body)

```
The access token can be obtained using
```ruby
   data[:token]
```
