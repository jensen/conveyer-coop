class ApplicationController < ActionController::Base
  include CartHelper
  include SessionsHelper

  private
    def authenticate_user
      unless logged_in?
        head :unauthorized
      end
    end
end
