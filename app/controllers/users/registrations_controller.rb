class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end
end
