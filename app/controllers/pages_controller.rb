class PagesController < ApplicationController
  def home
    @cuties = Cutie.all
  end
end
