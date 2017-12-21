# Project Title

A simple on-demand Prompt system to get values from User's choice.

## Getting Started

To start using Prompt, simply require it and use it that way:

```ruby
prompt_text = "Do your Choice !" # Prepare the Prompt Text

choices = [                      # Prepare the choices given to the Prompt
["choice 1", "value 1"],
["choice 2", "value 2"],
["choice 3", "value 3"],
["choice 4", "value 4"],
["choice 5", "value 5"],
  ]

value1 = prompt(prompt_text, choices) # Get the prompt result
value2 = prompt(prompt_text, choices) # Get the prompt result

puts "The Prompt returned: #{value1} & #{value2}"
```

## Customisation options
You can change the following parameters by changing the Prompt Class Variables:
```ruby
Prompt.clear = ...     # Set the string used to clear the terminal.
Prompt.separator = ... # Set the string used to separate the prompt text from the choices.
Prompt.indicator = ... # Set the string used to highlight the current choice.
```

## Contributing

I'm not a expert Crystal developper (far from it..), so feel free to give me some tips. ;)

## Authors
* **Samuel NAIT**
