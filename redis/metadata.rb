maintainer "Peritor GmbH"
maintainer_email "scalarium@peritor.com"
license "Apache 2.0"
description "Installs and configures Redis for client or server"
version "0.1"
recipe "redis::server", "Installs packages required for Redis servers"
recipe "redis::configure", "Re-configure Redis clients"

supports 'ubuntu'

