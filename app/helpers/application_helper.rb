module ApplicationHelper

  # Render the necessary tag that will ultimately contain 
  # the Svelte component identified by `name`.
  def svelte_component(name, attributes)
    html = attributes.reduce("") do |s, (key, value)|
      s + "data-#{key}=#{value}"
    end
    return "<div class='svelte-component' data-component=#{name.underscore} #{html}></div>".html_safe
  end

end
