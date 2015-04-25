class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

   #DELETE /resource/sign_out
  # def destroy
   #  super
    # redirect_to new_branch_path
 # end
 # def destroy
 #   respond_to do |format|
 #     format.html{ super }
 #     format.json do
 #       redirect_path = after_sign_out_path_for(resource_name)
 #       signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
 #       code = signed_out ? "S_OK" : "FA_UNKNOWN_ERROR";
 #       render :json => {:code => code, :redirect => redirect_path}
 #     end
 #   end
 # end


  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
