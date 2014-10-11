require 'test_helper'

class UserSignUpFlowTest < ActionDispatch::IntegrationTest
  test 'User should be redirected to dashboard after signing up' do
    visit new_user_registration_path

    fill_in User.human_attribute_name(:email), with: 'abcde@example.com'
    fill_in User.human_attribute_name(:first_name), with: 'hello'
    fill_in User.human_attribute_name(:last_name), with: 'world'
    fill_in User.human_attribute_name(:password), with: 'password'
    fill_in User.human_attribute_name(:password_confirmation), with: 'password'
    click_button I18n.t('sign_up')

    assert_equal dashboard_user_path(User.last), page.current_path
  end
end
