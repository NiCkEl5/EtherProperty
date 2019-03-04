module Routing
  module Property
    def self.registered(app)
      app.get '/property/:property_id' do
        erb :property_form, :layout => :universal_layout
      rescue StandardError => e
        puts "[Exception caught] #{e.class}: #{e.message}"
        pp e.backtrace
        halt 500, {error: 'Internal Server Error'}.to_json
      end
    end
  end
end