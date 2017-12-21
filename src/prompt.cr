require "./prompt/*"
require "colorize"

module Prompt
  @@clear = "\033[2J\033[1;1H" # This clears the terminal on puts..
  @@selector = "=>"
  @@separator = "="

  def self.listenToKeyPress
    chars = [] of Char # First init of the chars array..
    while true
      char = STDIN.raw &.read_char # Read the last char pressed in the terminal
      if char == '\u{3}'           # If it's ctrl+C
        break                      # Break the Loop
      elsif char == '\r'
        return "enter"
      else
        # p char
        chars << char if char # Fill the chars array, we do this because pressing the arrow keys (for example) makes three different chars.
        # puts chars.last(3)
        if chars.last(3) == ['\e', '[', 'A'] # If the last 3 chars or the ones of Arrow Up key..
          return "up"
        elsif chars.last(3) == ['\e', '[', 'B'] # If the last 3 chars or the ones of Arrow Down key..
          return "down"
        end
        chars = chars.last(3) # Limit the chars array to the 3 last chars.
      end
    end
  end

  def self.prompt(text, choices, selected = 0)
    puts @@clear
    puts text
    puts @@separator*30
    choices.each_with_index do |choice, index|
      choice_text = choice[0]
      if index == selected
        puts "#{@@selector} #{choice_text}".colorize.fore(:green)
      else
        puts "#{choice_text}"
      end
    end

    key = listenToKeyPress
    if key == "enter"
      value = choices[selected][1]
      puts @@clear
      return value
    elsif key == "up"
      selected -= 1 if selected > 0
      prompt(text, choices, selected)
    elsif key == "down"
      selected += 1 if selected < choices.size - 1
      prompt(text, choices, selected)
    end
  end

  prompt_text = "Do your Choice !" # Prepare the Prompt Text
  choices = [                      # Prepare the choices given to the Prompt
["choice 1", "value 1"],
["choice 2", "value 2"],
["choice 3", "value 3"],
["choice 4", "value 4"],
["choice 5", "value 5"],
  ]
end
