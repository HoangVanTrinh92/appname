class Operator::RegistrationsController < Devise::RegistrationsController
  def update
    resource = @operator
    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      flash[:success] = t "messages.change_password_success"
      NotificationMailer.send_email_after_change_password(@operator).deliver_later
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      flash[:danger] = t "messages.change_password_fail"
      redirect_to :back
    end
  end
end
