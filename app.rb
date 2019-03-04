#!/usr/bin/env ruby
# frozen-string-literal: true
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'sinatra'
require 'sinatra/content_for'
require 'rack/contrib'
require 'sequel'
require 'json'
require 'yaml'
require 'logger'
require 'mysql2'

require_relative 'routes/property'

JWT_SECRET = ENV.fetch('JWT_SECRET') { SecureRandom.hex(64) }
DB = Sequel.connect(ENV['DATABASE_URL'] || "mysql2://root:root@localhost/etherproperty?encoding=utf8")
#TODO remove from PROD
DB.loggers << Logger.new('log/database.log')
DB.extension :date_arithmetic


class Etherproperty < Sinatra::Base
  use Rack::PostBodyContentTypeParser
  use Rack::BounceFavicon
  helpers Sinatra::ContentFor

  register Routing::Property
  # disable :logging

  get '/ping' do
    200
  end

end
