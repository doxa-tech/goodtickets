module ApplicationHelper

  # Render the necessary tag that will ultimately contain 
  # the Svelte component identified by `name`.
  # see `SvelteAdapter.js`
  def svelte_component(name, attributes={})
    html = attributes.reduce("") do |s, (key, value)|
      s + "data-#{key}=#{value}"
    end
    return "<div class='svelte-component' data-component=#{name} #{html}></div>".html_safe
  end

end
