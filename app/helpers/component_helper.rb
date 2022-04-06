module ComponentHelper
  def render_component(component, **options)
    render component.new(**options)
  end
end
