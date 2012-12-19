module ApplicationHelper
  def title
    base_title = "ROR"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end

  end
  def logo
  	return image_tag("logo.png", :alt => "Sample App1", :class => "round")
  end
  
  
end
