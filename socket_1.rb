require 'socket'

# # Create the server socket.
# server = Socket.new(:INET, :STREAM)
# addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
# server.bind(addr)
# server.listen(128)

# # Accept a new connection.
# loop do
#   connection, _ = server.accept

#   print 'Connection class: '
#   p connection.class

#   print 'Server fileno: '
#   p server.fileno

#   print 'Connection fileno: '
#   p connection.fileno

#   print 'Local address: '
#   p connection.local_address

#   print 'Remote address: '
#   p connection.remote_address

#   # handle connection
#   connection.close
# end


# # Client code
# socket = Socket.new(:INET, :STREAM)

# # Initiate a connection to google.com on port 80.
# remote_addr = Socket.pack_sockaddr_in(80, 'google.com')
# socket.connect(remote_addr)

# one_kb = 1024 # bytes

# Socket.tcp_server_loop(4481) do |connection|
#   # Simplest way to read data from the connection.
#   while data = connection.read(one_kb) do
#   	puts data
#   end

#   # Close the connection once we're done reading. Lets the client
#   # know that they can stop waiting for us to write something back.
#   connection.close
# end

# one_hundred_kb = 1024 * 100 # bytes

Socket.tcp_server_loop(4481) do |connection|
	begin
		# Simplest way to read data from the connection.
  		while data = connection.readpartial(one_hundred_kb) do
  			puts data
  		end
  	rescue EOFError
  	end

  # Close the connection once we're done reading. Lets the client
  # know that they can stop waiting for us to write something back.
  connection.close
end


