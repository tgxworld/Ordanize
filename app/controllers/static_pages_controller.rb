class StaticPagesController < ApplicationController
  layout 'homepage', only: :homepage

  def homepage
  end

  def pricing
  end
end
