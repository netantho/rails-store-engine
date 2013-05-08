module ApplicationHelper
  def nav_link(link_text, link_path)
    content_tag(:li, :class => nav_class(link_text)) do
      link_to link_text, link_path
    end
  end
  
  def nav_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end
end
