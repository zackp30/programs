require 'thor'
class Test < Thor
  desc "Yes, hello.", "Hai!"
  def example
    puts "Hai!"
  end
end
