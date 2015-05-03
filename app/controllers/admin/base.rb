class Admin::Base < ApplicationController
  before_filter :admin_login_required
  before_action :authenticate_user!

  private
  def admin_login_required
    not_found unless current_user && (current_user.email == 'fantastic.ron@gmail.com' || current_user.email == 'yasuoka-yasuo@i.softbank.jp' || current_user.email == 'thmail.gh.5709@me.com')
  end
end