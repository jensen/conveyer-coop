module ImageHelper
  def resizeable_image_tag(source, width, height, options = {})
    image_tag "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=#{width},height=#{height},format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/store/header/#{source}", options
  end
end