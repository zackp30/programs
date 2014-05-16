require 'socket'

host = "localhost"
port = "2000"


thread1 =  Thread.new(loop {
server = TCPServer.open(host, port)
client = server.accept

client.puts("SYSTEM TIME WILL RECUR 10 TIMES")
for i in 1..10 do
    sleep 1
    client.puts("RECURANCE #{i} #{Time.now}")
end
    server.close
})
print thread1.alive?
