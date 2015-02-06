require 'bitly'
require 'dotenv'
require 'uri'

Dotenv.load

Bitly.use_api_version_3

Bitly.configure do |config|
    config.api_version = 3
    config.access_token = ENV['BITLY_ACCESS_TOKEN']
end

BITLY_URL_ROOT = "http://bit.ly/"
LOCAL_SITE_PREFIX = "http://casey.kolderup.org/bitkv/"

def self.put(val)
  record ||= {}
  encoded = "#{LOCAL_SITE_PREFIX}#{URI::encode(val)}"
  short_url = Bitly.client.shorten(encoded).short_url
  hash = short_url.sub /#{BITLY_URL_ROOT}/, ''
  record[hash] = val
  hash
end

def self.get(key)
  long_url = Bitly.client.expand("#{BITLY_URL_ROOT}#{key}").long_url
  encoded = long_url.sub /#{LOCAL_SITE_PREFIX}/, ''
  URI::decode(encoded)
end

test = "1234 testing hi!! ok"
puts "storing '#{test}'"
key = put(test)
puts "stored. keyed at #{key}. fetching..."
remote_val = get(key)
puts "fetched '#{remote_val}'"
