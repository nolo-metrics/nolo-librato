require_relative 'handler'
require 'nolo/metric'
require 'json'

module Nolo
  module Librato

    # collects metrics from a plugin and sumbits them to a handler
    class Sink
      attr_accessor :stream, :credentials
      def initialize(stream, credentials)
        self.stream = stream
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
        metrics = []
        raw_metrics.each do |plugin_name, data|
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

      private
      def hostname
        `hostname -f`.chomp # TODO: use fqdn
      end
      def date
        @date ||= Time.now
      end
      def raw_metrics
        JSON.parse stream.read
      end
    end

  end
end
