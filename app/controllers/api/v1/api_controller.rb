class Api:V1:ApiController < ActionController::Base
  before_action :authenticate_user!
end