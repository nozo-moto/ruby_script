class Schedule
  def initialize(command_list, file_name)
    @commands = command_list
    @tasks = []
    @file_name = file_name
    open_tasks
  end
  def open_tasks
    File.open(@file_name, 'r') do |file|
      @tasks = JSON.load(file)
    end
    if @tasks
      puts "| loading file..."
    else
      @tasks = []
      puts "| making new file..."
    end
  end
  def close_tasks
    File.open(@file_name, 'w') do |file|
      JSON.dump(@tasks, file)
    end
    puts "save file..."
  end
  def add
    result = ["| input task name:", "| When does it begin: ", "| any other memo:  "].map { |it|
      print it
      gets.chomp
    }
    @tasks.push({task: result[0], day: result[1], memo: result[2]})
  end
  def show_tasks
    @tasks.map.with_index { |e, i|
      puts "| | #{i} : #{e}"
    }
  end
  def delete_task
    show_tasks
    print "| input : "
    @tasks.delete_at(gets.chomp().to_i)
  end
  def main
    loop do
      puts "| command => #{@commands}"
      print "| input: "
      command_input = gets.chomp()
      case command_input
      when 'exit'
        close_tasks
        break
      when 'add'
        add
      when 'list'
        show_tasks
      when 'delete'
        delete_task
      else
        puts "| Error\nThere is no command such as #{command_input}"
      end
    end
  end
end
