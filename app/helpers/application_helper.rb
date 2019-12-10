module ApplicationHelper
    def mobile_device
        agent = request.user_agent
        return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
        return "mobile" if agent =~ /Mobile|webOS/
        return "desktop"
    end

    def is_valid_section?(section) 
        ["experience", "information", "jobs", "projects", "contact"].include? section
    end

    def js_url
        JAVASCRIPT_URL
    end

    def css_url
        CSS_URL
    end
end
