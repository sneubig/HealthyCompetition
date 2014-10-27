Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, "ec56b57fd3034d9bbe6c27bb4835546f", "91e174c9818d4696bf34d9213c508cc0"
end