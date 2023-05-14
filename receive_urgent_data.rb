require 'socket'

Socket.tcp_server_loop(4481) do |connection|
  # receive urgent data first
  urgent_data = connection.recv(1, Socket::MSG_OOB)

  data = connection.readpartial(1024)
  puts data
end