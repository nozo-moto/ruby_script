require_relative './weather_api'
require_relative './commands'
require_relative './schedule'

if __FILE__ == $0
  puts "---------------\t Hello CalenderOfRuby \t ----------"
  loop do
    print "| commands => #{Command::COMMAND_LIST}\n| input:\n"
    command = Commands.new(Command::COMMAND_LIST)
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
