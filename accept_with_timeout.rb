server = TCPServer.new(4481)
timeout = 5 # seconds

begin
  server.accept_nonblock
rescue Errno::EAGAIN
  if IO.select([server], nil, nil, timeout)
    retry
  else
    raise Timeout::Error
  end
end