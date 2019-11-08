class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protected

  def layout_by_resource
    devise_controller? ? "devise_#{resource_class.to_s.downcase}" : "application"
  end
end
