# frozen_string_literal: true

class HeaderComponent < ApplicationComponent
  private

    def current_cart
      helpers.current_cart
    end

    def show_authed?
      helpers.logged_in?
    end

    def show_auth_links?
      true unless current_page?(login_path) or current_page?(register_path)
    end
end
