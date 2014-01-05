require_relative 'collector'

module Nolo
module Librato

# command-line wrapper takes environment and parameters, ensures sanity, and passes them to the collector
class CLI
  attr_accessor :plugin, :credentials
  def initialize(env, *argv)
    self.plugin = argv.first
    self.credentials = {
      user: env['LIBRATO_USER'],
      token: env['LIBRATO_TOKEN']
    }
  end

  def run
    collector = Collector.new(plugin, credentials)
    collector.run
  end

end

end
end
