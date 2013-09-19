require './lib/assets'

class Commands

  class LoadCommand
    def match?(command)
      command == "load"
    end

    def execute(load_commands)
      filename = load_commands[1]
      if filename.nil?
        output = "Sorry, need to designate which file you would like to load. 'load <filename>'."
        puts output
      else
        contents = Assets.new.open_file(filename)
        assets = Assets.new
        @attendees = assets.row_names(contents)
        output = "'#{filename}' loaded"
        puts output
      end
      return output
    end
  end

  class FindCommand
    attr_reader :queue, :attendees

    def initialize
      @queue = Queue.new
    end

    def match?(command)
      command == "find"
    end

    def finding(attribute,value)
      value = value.downcase
      attribute = attribute.to_sym
      
      @attendees.select {|a| a == attribute}
      # @attendees.select {|2nd| 2nd == value}


      puts "searching"
    end

    def execute(command_parts)
      @queue.clear

      find_field = command_parts[1]
      find_value = command_parts[2]


      case find_field
        when "regdate"
          puts "This is the find regdate"
        when "first_name"
          puts "Got to first_name"
          finding(find_field,find_value)
        when "last_name"
          puts "This is the find last_name"
        when "email_address"
          puts "This is the find email_address"
        when "homephone"
          puts "This is the find homephone"
        when "street"
          puts "This is the find street"
        when "city"
          puts "This is the find city"
        when "state"
          puts "This is the find state"
        when "zipcode"
          puts "This is the find zipcode"
        when nil
          puts "The 'find' command needs to search for something, utilized by 'find attribute'. Available attributes are: 'RegDate', 'first_name', 'last_name', 'email_address', 'homephone', 'street', 'city', 'state' & 'zipcode'."
      end
    end

  end

  class QuitCommand
    def match?(command)
      command == "quit"
    end

    def execute(filler)
      puts "I hope you enjoyed your stay!"
      exit
    end
  end

  class HelpCommand
    def match?(command)
      command == "help"
    end

    def execute(command_parts)
      specific_help = command_parts[1]
      case 
        when specific_help.nil?
          puts "The 'help' command will give you some more information on the 'queue' & 'find' commands. To utilize please type 'help <command>' "
        when specific_help == 'queue'
          puts "This is the queue help"
        when specific_help == 'find'
          puts "This is the find help"
      end
    end
  end

  class QueueCommand
    attr_reader :queue

    def initialize
      @queue = Queue.new
    end

    def match?(command)
      command == "queue"
    end

    def execute(command_parts)
      case
        when command_parts[1].nil?
          queue = "The available queue commands are: 
          'queue count', 'queue clear', 'queue print', 
          'queue print by <filename>', 'queue save to <filename>'. " 
          puts queue
          return queue
        when command_parts[1] == "count"
          queue_count = @queue.size
          puts "This is the count of your queue: #{queue_count}"
          return @queue
        when command_parts[1] == "clear"
          clear_queue = @queue.clear
          puts "Reseting your queue."
          return queue
        when command_parts[1..2].join(" ") == "print by"
          printing_queue = @queue
          puts queue
          return queue
        when command_parts[1] == "print"
          queue = "print"
          puts queue
          return queue
        when command_parts[1..2].join(" ") == "save to"
          queue = "save to"
          puts queue
          return queue
      end
      return queue
    end
  end

  class NoActionCommand
    def match?(command)
      true
    end

    def execute(parts)
      puts "I don't recognize that command. Please refer to 'help' if you need assistance."
    end
  end

end
