require "twitter"

class TwitterAPI
  def initialize
    @rest_client = Twitter::REST::Client.new do |config|
      config.consumer_key = TwitterKEY::ConsumerKey
      config.consumer_secret = TwitterKEY::ConsumerSecretKey
      config.access_token = TwitterKEY::AccessToken
      config.access_token_secret = TwitterKEY::AccessTokenSecret
    end
  end
  def get_timeline(id)
    @tweets = []
    @rest_client.user_timeline(id, :count => 200, :exclude_replies => true, :include_rts => false).each do |tweet|
      # puts tweet.user.to_s + tweet.text.to_s
      @tweets.push({id: tweet.user.to_s, text: tweet.text.to_s})
    end
  end
  def save_timeline
    # id, file_name
    input_result = ["| whoes timeline want you save \n| input id : ", "| input file name : "].map { |it|
      print it
      gets.chomp
    }
    File.open("./tweet_data/#{input_result[1]}", "w").close()
    get_timeline(input_result[0])
    File.open("./tweet_data/#{input_result[1]}", 'w') do |file|
      JSON.dump(@tweets, file)
    end
  end
  def main
    print("| save ?\n| input: ")
    command_input = gets.chomp()
    case command_input
    when 'save'
      save_timeline
    else
      puts "| Error\nThere is no command such as #{command_input}"
    end
  end
end
