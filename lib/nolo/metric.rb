module Nolo
# Metric is a value object for storing metrics
class Metric < Struct.new(:hostname, :date, :plugin_name, :metric, :value)
# todo: lowercase hostname
end
end
