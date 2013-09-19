require './lib/commands'

class ProcessCommands

  def initialize
    @commands = Commands.new
  end

  def commands_list
    load = Commands::LoadCommand.new
    quit = Commands::QuitCommand.new
    help = Commands::HelpCommand.new
    queue = Commands::QueueCommand.new
    find = Commands::FindCommand.new
    no_action = Commands::NoActionCommand.new

    [ load, quit, help, queue, find, no_action]
  end

  def execute_command(input)
    parts = input.split(" ")
    @command = parts[0]

    user_submitted_command(@command).execute(parts)
  end

  def user_submitted_command(command_input)
    commands_list.find { |command| command.match?(command_input) }
  end


end
