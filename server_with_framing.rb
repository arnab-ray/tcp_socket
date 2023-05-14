require 'socket'

# This gets us the size of a random fixed-width integer.
SIZE_OF_INT = [11].pack('i').size

module CloudHash
  class Server
    def initialize(port)
      # Create the underlying server socket.
      @server = TCPServer.new(port)
      puts "Listening on port #{@server.local_address.ip_port}"
      @storage = {}
    end

    def start
      # The familiar accept loop.
      Socket.accept_loop(@server) do |connection|
        handle(connection)
        connection.close
      end
    end

    def handle(connection)
      # The message size is packed into a fixed-width. We 
      # read it and unpack it.
      packed_msg_length = connection.read(SIZE_OF_INT)
      msg_length = packed_msg_length.unpack('i').first
     
      # Fetch the full message given its length.
      request = connection.read(msg_length)
      connection.write process(request)
    end

    # Supported commands:
    # SET key value
    # GET key
    def process(request)
      command, key, value = request.split

      case command.upcase
      when 'GET'
        @storage[key]

      when 'SET'
        @storage[key] = value
      end
    end
  end
end

server = CloudHash::Server.new(4481)
server.start