require './config/boot'

include Futest::Helpers

# Load tests. Comment out the ones you don't want to run.
begin
  start = Time.now
  [
    # 'extension',
    'model'
  ].each{|t| require_relative "#{t}_test"}
rescue => x
  puts x.message
  puts x.backtrace
  err(x)
ensure
  puts Time.now - start
end
