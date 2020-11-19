class WelcomeController < ApplicationController
  def home
   @jobs = Job.all
  end
end
