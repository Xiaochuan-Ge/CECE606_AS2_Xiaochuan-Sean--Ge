module ApplicationHelper
  def sortable(column_name, display_text)
    current_sort_by = params[:sort_by] || session[:sort_by]
    current_direction = params[:direction] || session[:direction]
    
    rank_order_show = ''
    if current_sort_by != column_name
      direction = "asc"
      # rank_order_show = '-'
    else
      if current_direction == "asc"
        direction = "desc"
        rank_order_show = ' ▲'
      elsif current_direction == "desc"
        direction = nil
        rank_order_show = ' ▼'
      else
        direction = "asc"
        # rank_order_show = '-'
      end
    end
    
    css_class = (current_sort_by == column_name) ? "current #{current_direction}" : nil

    
    link_to (display_text+  rank_order_show), movies_path(sort_by: column_name, direction: direction), { class: css_class }
  end
end