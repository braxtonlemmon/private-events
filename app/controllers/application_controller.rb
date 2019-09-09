class ApplicationController < ActionController::Base
	protect_from_forger with: :exception
	include SessionsHelper
end
