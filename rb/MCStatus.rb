require 'socket'
hostname = 'mc.shadowempire.in'
port = '25565'

s = TCPSocket.open(hostname, port)

s.write([0xFE, 0x01, 0xFA].pack('CCC'))
s.read(1).unpack('CCC')
len = socket.read(2).unpack('n').first
return {
    :protocol_version => resp.shift.to_i
}
s.close
