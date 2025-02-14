# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_borrowings = current_user.borrowings.where(returned_date: nil)
    @past_borrowings = current_user.borrowings.where.not(returned_date: nil)
  end
end