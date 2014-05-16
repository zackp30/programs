require 'rubygems'
require 'dcell'

DCell.start id: "fish", addr: "tcp://127.0.0.1:9078"

class Fish
  include Celluloid

  def initialize
    puts  "Fish node online."
    pls_node = DCell::Node["pls"]
    pls_node[:pls].shutdown_node("pls")
  end
end
Fish.supervise_as :fish
sleep
