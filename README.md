Nolo-Librato
============

[![Build Status](https://travis-ci.org/nolo-metrics/nolo-librato.png)](https://travis-ci.org/nolo-metrics/nolo-librato)

`nolo-librato` is an easy way to pipe your nolo plugins into [librato
metrics](https://metrics.librato.com).

Usage
-----

Ensure you've set the `LIBRATO_USER` and `LIBRATO_TOKEN` environment
variables.

You can easily schedule running a meter by adding it to your crontab:

    * * * * * /opt/nolo/bin/nolo-json /opt/nolo/plugins/load | LIBRATO_USER=foo LIBRATO_TOKEN=bar /opt/nolo/bin/nolo-librato

Installation
------------

`nolo-librato` is intended to be installed via the
[RubyGems](http://rubygems.org/) system.  To get the latest
version, simply enter the following into your command prompt:

	$ gem install nolo-librato

You must have [RubyGems](http://rubygems.org/) installed for
the above to work.

If you want to build the gem locally, run the following command:

  $ gem build nolo-librato.gemspec

Features/Problems
-----------------

* None! (yet)

LICENSE
-------

Nolo is Copyright (c) 2012 [Joseph Anthony Pasquale
Holsten](http://josephholsten.com) and distributed under the ISC
license. See the `LICENSE` file for more info.

