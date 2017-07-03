class Commands
  def initialize
    @commands = Command::COMMAND_LIST
  end
  def schedule
    puts "---------------\t weather \t ----------"
    schedule = Schedule.new()
    schedule.main
  end
  def weather
    puts "---------------\t weather \t ----------"
    print "| input where\n| "
    api = WeatherAPI.new
    puts api.weather(gets.chomp())[0].description
  end
end
