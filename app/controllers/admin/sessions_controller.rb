class Admin::SessionsController < Devise::SessionsController
  def new
    super
  end

  private
  def after_sign_in_path_for resource
    current_user.role? ? admin_products_path : root_path
  end

  def after_sign_out_path_for _resource_or_scope
    new_user_session_path
  end
end
