module ApplicationHelper

  def render_markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(text).html_safe
  end
end
