class ApplicationController < ActionController::Base
  def index
    @js_url = JAVASCRIPT_URL
    @css_url = CSS_URL
  end
end
