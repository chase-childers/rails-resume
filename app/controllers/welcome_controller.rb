class WelcomeController < ApplicationController
  def index
    @data = ResumeHelper.get_resume_data
  end
end
