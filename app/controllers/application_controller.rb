class ApplicationController < ActionController::Base
	protect_from_forgery
	include SessionsHelper
end
class String
  def shuffle
    self.split('').shuffle.join
  end

end

