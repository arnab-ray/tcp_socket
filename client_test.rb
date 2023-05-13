require 'socket'

# client = TCPSocket.new('localhost', 4481)
# client.write('gekko')
# client.close

Socket.tcp_server_loop(4481) do |connection|
  # Simplest way to write data to a connection.
  connection.write('Welcome!')
  connection.close
end