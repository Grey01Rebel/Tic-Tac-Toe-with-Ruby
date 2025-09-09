require_relative 'Player'
require_relative 'board'
require_relative 'game'

puts "Welcome to Tic Tac Toe!"
game = Game.new
game.play
