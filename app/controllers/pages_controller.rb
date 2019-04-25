class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @contact = Contact.new
  end

  def notre_histoire
  end

  def notre_equipe
  end

  def nos_actions
  end

  def nous_soutenir
  end

  def eshop
  end

  def nous_contacter
  end
end
