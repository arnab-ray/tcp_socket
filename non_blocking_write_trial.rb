require 'socket'

client = TCPSocket.new('localhost', 4481)
payload = 'Lorem ipsum' * 100_000_000

written = client.write_nonblock(payload)
written < payload.size #=> true