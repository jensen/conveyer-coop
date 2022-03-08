module Sluggable
  extend ActiveSupport::Concern

  def set_slug_from_name
    self.slug = self.name.gsub("'", "").parameterize
  end
end