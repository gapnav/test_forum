require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  self.responder = ApplicationResponder
  respond_to :html
  responders :flash
  protect_from_forgery with: :exception
end
