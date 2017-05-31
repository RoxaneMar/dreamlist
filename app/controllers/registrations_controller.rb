class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      edit_profile_path
    end
end
