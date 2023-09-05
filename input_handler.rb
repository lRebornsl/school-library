class InputHandler
  def self.get_integer_input(prompt)
    print prompt
    input = gets.chomp
    input.to_i
  end

  def self.get_string_input(prompt)
    print prompt
    gets.chomp
  end

  def self.get_yes_no_input(prompt)
    print "#{prompt} (Y/N): "
    input = gets.chomp.downcase
    input == 'y'
  end
end