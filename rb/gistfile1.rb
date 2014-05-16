require 'socket'

##
# Pings a minecraft server and returns motd and playercount.
# Works with ruby >=1.9.3/2.0.0
#
# More information and sample code here:
# http://wiki.vg/Server_List_Ping
##
class MinecraftPing
  def initialize(host, port=25565)
    @host = host
    @port = port
  end

  def ping
    socket = TCPSocket.open(@host, @port)
    # packet identifier & payload ...
    socket.write([0xFE, 0x01, 0xFA].pack('CCC'))
    socket.write(encode_string('MC|PingHost'))
    socket.write([7 + 2 * @host.length].pack('n'))
    socket.write([74].pack('c'))
    socket.write(encode_string(@host))
    socket.write([@port].pack('N'))

    # read server response
    if socket.read(1).unpack('C').first != 0xFF # Kick packet
      raise 'unexpected server response packet'
    end

    len = socket.read(2).unpack('n').first
    resp = decode_string(socket.read(len*2)).split("\u0000")

    socket.close

    if resp.shift != "\u00A71"
      raise 'unexpected server response fields'
    end

    return {
      :protocol_version => resp.shift.to_i,
      :minecraft_version => resp.shift,
      :motd => resp.shift,
      :current_players => resp.shift.to_i,
      :max_players => resp.shift.to_i
    }
  end

  private

  def encode_string(s)
    begin
      [s.length].pack('n') + Iconv.conv('utf-16be', 'utf-8', s)
    rescue
      [s.length].pack('n') + s.encode('utf-16be').force_encoding('ASCII-8BIT')
    end
  end

  def decode_string(s)
    begin
      Iconv.conv('utf-8', 'utf-16be', s)
    rescue
      s.force_encoding('utf-16be').encode('utf-8')
    end
  end
end

puts MinecraftPing.new('aztec.geekosphere.org').ping.inspect
puts MinecraftPing.new('night.no-ip.org', 25565).ping.inspect
