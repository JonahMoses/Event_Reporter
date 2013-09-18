class Commands

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

    def execute(parts)
      puts "queue"
    end

  end

  class FindCommand

    def match?(command)
      command == "find"
    end

    def execute(parts)
      puts "find"
    end

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
