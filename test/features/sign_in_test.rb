require "test_helper"

feature "As a user, I want to sign in with my ID.me account to access my discounts" do
  scenario "Sign in with ID.me OAuth" do
    visit root_path
    click_on "Login with ID.me"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:idme]
    OmniAuth.config.add_mock(:idme,
                            {
                            uid: '12345',
                            info: { nickname: 'test_idme_user'},
                            })
    click_on "Login with ID.me"
    save_and_open_page
    page.must_have_content "test_idme_user, you are signed in!"
    # Courtesy of: https://gist.github.com/ivanoats/7071730
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end
end
