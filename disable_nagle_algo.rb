require 'socket'

server = TCPServer.new(4481)

# Disable Nagle's algorithm. Tell the server to send with 'no delay'.
server.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)