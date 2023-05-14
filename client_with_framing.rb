require 'socket'

module CloudHash
  class Client
    def initialize(host, port)
      @connection = TCPSocket.new(host, port)
    end

    def get
      request "GET #{key}"
    end

    def set
      request "SET #{key} #{value}"
    end

    def request(string)
      @connection.puts(string)

      # Read until receiving a newline to get the response.
      @connection.gets
    end
  end
end

# CloudHash::Client.host = 'localhost'
# CloudHash::Client.port = 4481

client = CloudHash::Client.new('localhost', 4481)

payload = 'SET prez obama'

# Pack the message length into a fixed-width integer.
msg_length = payload.size
packed_msg_length = [msg_length].pack('i')

connection = CloudHash::Client.connection.accept
# Write the length of the message, followed immediately
# by the message itself.
connection.write(packed_msg_length)
connection.write(payload)

# puts CloudHash::Client.set 'prez', 'obama'
# puts CloudHash::Client.get 'prez'
puts client.get 'vp'