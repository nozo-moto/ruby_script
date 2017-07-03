class Schedule
  def initialize()
    @commands = ['add', 'list', 'delete', 'exit']
    @tasks = []
    open_tasks
  end
  def open_tasks
    File.open("tasks.json") do |file|
      @tasks = JSON.load(file)
    end
    if @tasks
      puts "| loading file..."
    else
      @tasks = []
      puts "| making new file..."
    end
  end
  def main
    loop do
      puts "| command => #{@commands}"
      print "| input: "
      command_input = gets.chomp()
      case command_input
      when 'exit'
        File.open("tasks.json", 'w') do |file|
          JSON.dump(@tasks, file)
        end
        puts "save file..."
        break
      when 'add'
        print '| input task name: '
        task = gets.chomp()
        print '| When does it begin: '
        day = gets.chomp()
        print '| any other memo: '
        memo = gets.chomp()
        @tasks.push({task: task, day: day, memo: memo})
      when 'list'
        @tasks.map.with_index { |e, i|
          puts "| | #{i} : #{e}"
        }
      when 'delete'
        puts "| select number what you want to delete"
        @tasks.map.with_index { |e, i|
          puts "| | #{i} : #{e}"
        }
        print "| input : "
        @tasks.delete_at(gets.chomp().to_i)
      else
        puts "| Error\nThere is no command such as #{command_input}"
      end
    end
  end
end
