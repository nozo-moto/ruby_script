module Command
  COMMAND_LIST = ['weather', 'schedule', 'twitter', 'exit'].freeze
  FILE_NAME = "tasks.json".freeze
  SCHEDULE_COMMAND_LIST = ['add', 'list', 'delete', 'exit'].freeze
end

class Commands
  def initialize(command_list)
    @commands = command_list
  end
  def schedule
    puts "---------------\t schedule \t ----------"
    schedule = Schedule.new(Command::SCHEDULE_COMMAND_LIST, Command::FILE_NAME)
    schedule.main
  end
  def weather
    puts "---------------\t weather \t ----------"
    print "| input where\n| "
    api = WeatherAPI.new(OpenWeatherMap::KEY, OpenWeatherMap::BASE_URI)
    puts api.weather(gets.chomp())[0].description
  end
  def twitter
    a = TwitterAPI.new().main
  end
end
