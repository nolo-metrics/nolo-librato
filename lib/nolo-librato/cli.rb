require_relative 'sink'

module Nolo
module Librato

# command-line wrapper takes environment and parameters, ensures sanity, and passes them to the collector
class CLI
  attr_accessor :stream, :credentials
  def initialize(env, *argv)
    self.stream = ARGF
    self.credentials = {
      user: env['LIBRATO_USER'],
      token: env['LIBRATO_TOKEN']
    }
  end

  def run
    sink = Sink.new(stream, credentials)
    sink.run
  end

end

end
end
