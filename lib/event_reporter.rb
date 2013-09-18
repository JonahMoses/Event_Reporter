require './lib/process_commands'

class EventReporter


  # run loop 
  # load FILENAME
  #   => load(filename)

  # def load(filename)
  #   @assets = Assets.new.open(filename)
  # end

  def initialize
    @commands = ProcessCommands.new
  end

  def run
    puts "Welcome to the Event Reporter"
      while @command != "quit"
        printf "Awaiting your command: "
        input         = gets.chomp
        @commands.execute_command(input)
    end
  end

eventreporter = EventReporter.new
eventreporter.run


end
