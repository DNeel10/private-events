class ApplicationController < ActionController::Base

  def after_sign_out_path_for scope
      root_path
  end
end
