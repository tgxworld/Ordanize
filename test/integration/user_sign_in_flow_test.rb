require 'integration/integration_helper'

class UserSignInFlowTest < ActionDispatch::IntegrationTest
  test 'User should be redirected to dashboard after signing in' do
    user = users(:user)
    visit new_user_session_path

    fill_in User.human_attribute_name(:email), with: user.email
    fill_in User.human_attribute_name(:password), with: 'password'
    click_button I18n.t('log_in')

    assert_equal dashboard_user_path(user), page.current_path
  end
end
