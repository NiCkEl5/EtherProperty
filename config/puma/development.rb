#!/usr/bin/env puma

daemonize false
# pidfile '/var/run/puma.pid'
# bind 'unix:///var/run/puma.sock'
stdout_redirect 'log/stdout', 'log/stderr', true
#quiet