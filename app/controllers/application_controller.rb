class ApplicationController < ActionController::Base
  protect_from_forgery

end
class String
  def shuffle
    self.split('').shuffle.join
  end

end

