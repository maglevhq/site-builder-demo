module ApplicationHelper
  def render_markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(text).html_safe
  end

  def main_menu_item_css(name)
    if name.to_s == controller_name
      "border-ncuikit-primary text-gray-900 inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium"
    else
      "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium"
    end
  end
end
