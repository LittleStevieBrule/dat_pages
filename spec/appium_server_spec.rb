

describe DATPages::AppiumServer do


  it 'should start the server by default when instantiated' do
    server = DATPages::AppiumServer.new
    expect(server.status).to eq 'running'
    server.stop
  end

  it 'should respond to #start' do
    expect(DATPages::AppiumServer.new(false).respond_to? :start).to eq true
  end

  it 'should start the server if it is not running' do
    server = DATPages::AppiumServer.new(false)
    expect(server.status).to eq 'stopped'
    server.start
    expect(server.status).to eq 'running'
    server.stop
  end

  it 'should not start a server that is already started' do
    server = DATPages::AppiumServer.new
    expect(server.status).to eq 'running'
    result = server.start
    server.stop
    expect(result).to eq false

  end

  it 'should respond to #stop' do
    expect(DATPages::AppiumServer.new(false).respond_to? :stop).to eq true
  end

  it 'should stop a server thats running' do
    server = DATPages::AppiumServer.new
    expect(server.status).to eq 'running'
    server.stop
    expect(server.status).to eq 'stopped'
  end

  it 'should not stop a server that is already stopped' do
    server = DATPages::AppiumServer.new(false)
    expect(server.status).to eq 'stopped'
    expect(server.stop).to eq false
  end


  it 'should respond to #status' do
    expect(DATPages::AppiumServer.new(false).respond_to? :status).to eq true
  end


end