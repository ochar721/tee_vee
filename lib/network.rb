class Network
    attr_reader :name,
                :shows

  def initialize(network)
    @network = network
    @name    = "NBC"
    @shows   = []
  end

  def add_show(shows)
    @shows << shows
  end

end
