if Rails.env.production?
  $redis = Redis.new(:host => "bass.redistogo.com", :port => 9014, :password => "16d1b8359b3beb6ff4faf029f4e60929")
else
  $redis = Redis.new(:host => "localhost")
end
