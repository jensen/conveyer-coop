module ComponentHelper
  def render_component(component, **options, &block)
    render component.new(**options), &block
  end
end
