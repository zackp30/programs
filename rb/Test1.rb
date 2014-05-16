require 'rubygems'
require 'dcell'

DCell.start id: "pls", addr: "tcp://172.23.32.1:9089", registry: { adapter: 'redis', host: 'apertron.net', port: 6379}
class Pls
  include Celluloid

  def initialize
    mc_node = DCell::Node["mc"]
    puts "Pls node online."
    puts "#{mc_node[:mc2].server_status("games")}"
  end
  def pls
    "pls"
  end
end
Pls.supervise_as :pls
sleep
