class WelcomeController < ApplicationController
  def index
    @data = RESUME_DATA
  end
end
