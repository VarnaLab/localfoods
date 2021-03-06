module ApplicationHelper
	def title
		base_title ="Local Foods Coop"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
    end
  end

def sortable(column, remote, producer, category, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

  if remote 
  	link_to title, show_in_index_inventory_path(producer, :sort => column, :direction => direction, :inventory => {:category => category}), {:remote => true, :class => css_class}
  else
  	link_to title, {:sort => column, :direction => direction, :inventory => {:category => category}}, {:class => css_class}
  end
end

def category_sortable(column, category, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

  link_to title, show_all_categories_path(:sort => column, :direction => direction, :category => category), {:remote => true, :class => css_class}
end

def search_sortable(column, search, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction, :search => search}, {:class => css_class}
end

def order_sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end

def user_sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end

def cart_size(id)
  cart = Cart.find(id).cart_items.reload
  cart.size
end

def view_link(title, view = nil)
  link_to title, {:order_view => view}, {:class=> "btn btn-info"}
end

def link_to_cart_text
  return "Cart(" + current_user.cart.cart_items.count.to_s + ")"
end

end
