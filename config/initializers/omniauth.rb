Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, "4f4417a5e2134dc7bbc6d3aa46436979", "e17da7b06107457e8af0407cd4f4934d"
end