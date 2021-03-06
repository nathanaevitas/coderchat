module ApplicationHelper
	def active_link(link_text,link_path)
		class_name = current_page?(link_path) ? "active" : ""
		content_tag :li, class: class_name do
			content_tag :a do
				link_to link_text, link_path
			end
		end 
	end
end
