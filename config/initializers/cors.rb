Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://0.0.0.0:3000/'

      resource '*',
        headers: :any,
        methods: %i[get post put patch delete options head],
        expose: [:Authorization]
    end
end
