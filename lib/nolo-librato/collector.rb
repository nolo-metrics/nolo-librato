require_relative 'handler'
require 'nolo/metric'
require 'json'

module Nolo
module Librato

# collects metrics from a plugin and sumbits them to a handler
class Collector
  attr_accessor :plugin, :credentials
  def initialize(plugin, credentials)
    self.plugin = plugin
    self.credentials = credentials
  end
  # collect metrics and pass them to the handler
  def run
    metrics = collect_metrics
    send_metrics metrics
  end
  # collect metrics from each plugin, ensuring each has
  # hostname and date, and return those metrics
  def collect_metrics
    hostname = `hostname -f`.chomp # TODO: use fqdn
    date = Time.now
    raw_metrics = %x[nolo-json #{plugin}]
    metrics = []
    JSON.parse(raw_metrics).each do |plugin_name, data|
      data.each do |metric|
        metrics << Nolo::Metric.new(
          hostname,
          date,
          plugin_name,
          metric['identifier'],
          metric['value'])
      end
    end
    metrics
  end
  # submit all metrics to the handler
  def send_metrics(metrics)
    handler = Handler.new credentials
    handler.connect
    metrics.each do |metric|
      handler.send_metric metric
    end
    handler.close
  end
end

end
end
