require 'librato/metrics'

module Nolo
module Librato

# Handler submits metrics to Librato
class Handler
  attr_accessor :user, :token

  def initialize(config)
    self.user = config[:user]
    self.token = config[:token]
  end

  # authenticates against librato and initializes an empty metric queue for later submisson
  def connect
    ::Librato::Metrics.authenticate user, token
    @queue = ::Librato::Metrics::Queue.new
  end

  # adds a metric to the queue
  def send_metric(metric)
    key = sprintf '%s.%s', metric.plugin_name, metric.metric
    @queue.add key => {
      value: metric.value,
      source: metric.hostname,
      measure_time: metric.date
    }
  end

  # submits all metrics in the queue
  def close
    @queue.submit
  end
end

end
end

