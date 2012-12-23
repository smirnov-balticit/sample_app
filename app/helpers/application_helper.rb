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
  
  def gravatar_for(user, options = {size:50})
  	return gravatar_image_tag(user.email.downcase, class:"gravatar",alt:user.name, gravatar:options)
  end
  
  
end
