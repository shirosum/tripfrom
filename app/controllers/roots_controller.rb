class RootsController < ApplicationController
  before_action :authenticate_admin, only:[:admin_top]

  def top
  end

  def admin_top
  end

  def map
  end
end
