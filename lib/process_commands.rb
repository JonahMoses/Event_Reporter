require './lib/commands'

class ProcessCommands

  def initialize
    @commands = Commands.new
  end

  def commands_list
    quit = Commands::QuitCommand.new
    help = Commands::HelpCommand.new
    queue = Commands::QueueCommand.new
    find = Commands::FindCommand.new
    no_action = Commands::NoActionCommand.new

    [ quit, help, queue, find, no_action]
  end

  def user_submitted_command(command_input)
    commands_list.find { |command| command.match?(command_input) }
  end

  def execute_command(input)
    parts = input.split(" ")
    @command = parts[0]
    @help_for = parts[1]

    user_submitted_command(@command).execute(parts)
  end

end
