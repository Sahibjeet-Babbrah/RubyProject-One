module FavouriteHelper
    def sort_link(column:)
      direction = column == params[:column] ? future_direction : 'asc'
      display_arrow = sort_arrow_tag_for(column, direction)
      link_to_params = params.permit!.to_h.merge(column: column, direction: future_direction)
      link_to(
        display_arrow.html_safe,
        pages_favourite_users_path(link_to_params),
        data: {turbo_action: 'replace'}
      )
    end

    def future_direction
      case params[:direction]
        when '' then 'asc'
        when 'asc' then 'desc'
        else ''
      end
    end

    def sort_arrow_tag_for(column, direction)
      params[:column] == column ? sort_arrow(direction) : '⇅' #tag.i(class: "bi bi-arrow-down-up")
    end

    def sort_arrow(direction)
      case direction
        when 'asc' then '↑' # tag.i(class: "bi bi-arrow-up")
        when 'desc' then '↓' # tag.i(class: "bi bi-arrow-down")
        else '⇅' #tag.i(class: "bi bi-arrow-down-up")
      end
    end
end