require './lib/assets'

class Commands

  class LoadCommand
    def match?(command)
      command == "load"
    end

    def execute(load_commands)
      filename = load_commands[1]
      if filename.nil?
        output = "Sorry, need a file after load command"
      else
        output = "#{filename} loaded"
      end
      return output
    end
  end

  class FindCommand

    def match?(command)
      command == "find"
    end

    def execute(command_parts)
      specificfind = command_parts[1]
      if specificfind.nil?
        puts "The 'find' command needs to search for something, utilized by 'find attribute'. Available attributes are: 'RegDate', 'first_name', 'last_name', 'email_address', 'homephone', 'street', 'city', 'state' & 'zipcode'."
        elsif specificfind == 'regdate'
          puts "This is the find regdate"
        elsif specificfind == 'first_name'
          # loaded_assets = Assets.new
          # searched_first_name = loaded_assets.contents[:first_name]
          puts "This is the find first_name"
        elsif specificfind == 'last_name'
          puts "This is the find last_name"
        elsif specificfind == 'email_address'
          puts "This is the find email_address"
        elsif specificfind == 'homephone'
          puts "This is the find homephone"
        elsif specificfind == 'street'
          puts "This is the find street"
        elsif specificfind == 'city'
          puts "This is the find city"
        elsif specificfind == 'state'
          puts "This is the find state"
        elsif specificfind == 'zipcode'
          puts "This is the find zipcode"
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

    def execute(parts)
      specifichelp = parts[1]
      if specifichelp.nil?
      puts "The 'help' command will give you some more information on the 'queue' & 'find' commands. To utilize please type 'help <command>' "
      elsif specifichelp == 'queue'
        puts "This is the queue help"
      elsif specifichelp == 'find'
        puts "This is the find help"
      end
    end
  end

  class QueueCommand

    def match?(command)
      command == "queue"
    end
    #   "queue"
    #   "queue count",

    def execute(command_parts)
      if command_parts[1] == "count"
        queue = 0
      else
      queue = "The available queue commands are: 
      'queue count', 'queue clear', 'queue print', 
      'queue print by <filename>', 'queue save to <filename'. "
      end
      return queue
    end
    # [
    #   "queue clear",
    #   "queue print",
    #   "queue print by <attr>",
    #   "queue save to"
    # ]
  end

  class NoActionCommand
    def match?(command)
      true
    end

    def execute(parts)
      puts "NoAction"
    end
  end

end
