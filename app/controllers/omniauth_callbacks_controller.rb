class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def idme
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "#{user.name}, you are signed in!"
      sign_in_and_redirect user, notice: "#{user.name}, you are signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
end
