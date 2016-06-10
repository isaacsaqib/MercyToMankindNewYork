# Be sure to restart your server when you modify this file.

# StripeApp::Application.config.session_store :active_record_store

Rails.application.config.session_store :cookie_store, key: '_stripe_app_session'