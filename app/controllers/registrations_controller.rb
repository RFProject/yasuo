class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    series_index_path
  end

  def after_inactive_sign_up_path_for(resource)
    series_index_path
  end
end