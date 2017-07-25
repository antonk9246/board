module ApplicationHelper
  def sortable(title, column, direction)
    direction = sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == 'desc' ? '↓' : '↑'

    link_to ads_items_path, class: 'tiny button secondary', id: column do
      "#{title} &nbsp; #{icon}".html_safe
    end
  end
end
