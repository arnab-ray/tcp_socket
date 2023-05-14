require 'socket'

socket = TCPSocket.new 'localhost', 4481

# Send some data using the standard method
socket.write 'first'
socket.write 'second'

# Send some urgent data
socket.send '!', Socket::MSG_OOB