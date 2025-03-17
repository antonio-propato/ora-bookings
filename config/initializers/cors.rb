Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*" # Change this to your frontend domain in production, e.g., 'https://your-vue-app.com'
    resource "*",
      headers: :any,
      methods: [ :get, :post, :patch, :put, :delete, :options ]
  end
end
