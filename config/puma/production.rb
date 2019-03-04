#!/usr/bin/env puma

environment 'production'
daemonize true
pidfile '/var/run/puma.pid'
bind 'unix:///var/run/puma.sock'
stdout_redirect 'log/stdout', 'log/stderr', true
#quiet