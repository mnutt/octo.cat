if Rails.env.production?
  $redis = Redis.new(:host => "bass.redistogo.com", :port => 9014, :password => ENV['REDIS_PW'])
else
  $redis = Redis.new(:host => "localhost")
end
