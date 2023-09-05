require_relative 'list_hud'

class App
  def run
    list = ListHud.new
    list.display_options
    choice = gets.chomp.to_i
    while choice != 7
      list.option(choice)
      list.display_options
      choice = gets.chomp.to_i
    end
  end
end
