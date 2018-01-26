module WelcomeHelper

  def welcome_header
    if current_user
      render 'layouts/header'
    else
      render "layouts/welcome_header"
    end
  end
end
