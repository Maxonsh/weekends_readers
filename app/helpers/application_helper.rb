module ApplicationHelper
  def main_menu_item(name, path, action = [])
    action_available = action.include?(params[:action])
    content_tag :li, class: ('active' if action_available) do
      link_to name, path
    end
  end
end
