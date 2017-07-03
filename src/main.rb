require_relative './weather_api'
require_relative './open_weather_map'
require_relative './commands'
require_relative './schedule'

if __FILE__ == $0
  puts "---------------\t Hello CalenderOfRuby \t ----------"
  command_list = ['weather', 'schedule', 'exit']
  loop do
    print "| commands => #{command_list.to_s}\n| input:\t"
    command = Commands.new(command_list)
    command_input = gets.chomp()
    case command_input
    when "exit"
      break
    when "schedule"
        command.schedule()
    when "weather"
        command.weather()
    else
      puts "| Error\nThere is no command such as #{command_input}"
    end
    puts "------------------------------"
  end
end
