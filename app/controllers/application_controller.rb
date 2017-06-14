class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  include ApplicationHelper
  include SessionsHelper
  include QuestionsHelper

  before_action :clear_my_cache

end
