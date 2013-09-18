require 'minitest'
require 'minitest/autorun'
require './lib/commands'

class CommandsTest < MiniTest::Test




# def commands
#     quit      = QuitCommand.new
#     tweet     = TweetCommand.new(@client)
#     dmcommand = DMCommand.new(@client,@screen_names)
#     followers = FollowersCommand.new(@client,@screen_names)
#     spam      = SpamFollowers.new(@client,@screen_names)
#     no_action = NoActionCommand.new

#     [ quit, tweet, dmcommand, followers, spam, no_action ] #elt, s, turl, klout, 
#   end

#   def execute_command(input)
#     parts     = input.split(" ")
#     @command  = parts[0]
#     @username = parts[1]
#     message   = parts[1..-1].join(" ")

#     command_for_input(@command).execute(parts)
#   end

#   def command_for_input(command_input)
#     commands.find {|command| command.match?(command_input) }
#   end