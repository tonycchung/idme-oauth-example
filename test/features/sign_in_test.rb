require "test_helper"

feature "As a user, I want to sign into my ID.me account to access discounts" do
  scenario "sign in with ID.me works" do
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:idme]
    OmniAuth.config.add_mock(:idme,
                            {
                            uid: '12345',
                            info: { affiliation: 'Veteran', raw: { email: "test@example.com" }},
                            })
    visit root_path
    click_on "Sign in with ID.me"
    page.must_have_content "Sign in as test@example.com"

    # Courtesy of: https://gist.github.com/ivanoats/7071730
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end
end
