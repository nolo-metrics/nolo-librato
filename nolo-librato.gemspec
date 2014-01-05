# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nolo-librato/version'

Gem::Specification.new do |spec|
  spec.name              = "nolo-librato"
  spec.author            = "Joseph Anthony Pasquale Holsten"
  spec.email             = "joseph@josephholsten.com"
  spec.homepage          = "https://github.com/nolo-metrics/nolo-librato"
  spec.description       = "Send metrics from nolo plugins to Librato."
  spec.extra_rdoc_files  = %w[ LICENSE README.md TODO ]
  spec.rdoc_options      << "--charset=UTF-8" <<
                            "--title" << "Nolo-Librato Documentation" <<
                            "--main"  << "README.rdoc"
  spec.version           = Nolo::Librato::VERSION
  spec.summary           = spec.description.split(/\.\s+/).first
  spec.files             = `git ls-files`.split($/)
  spec.executables       = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.test_files        = spec.files.grep(/^test\/.*test_.*\.rb$/)

  spec.add_runtime_dependency      'librato-metrics', '>= 1.3.0'
  spec.add_development_dependency  'rake', '>= 10.0.4'
  spec.add_development_dependency  'rdoc', '>= 4.0.1'
end
