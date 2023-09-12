class V1::BaseController < ApplicationController
  include Authenticate

  attr_accessor :current_user

end
