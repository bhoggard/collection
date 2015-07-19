module LoginHelper
  def admin_login
    visit login_path
    fill_in "session_name", with: users(:barry).name
    fill_in "session_password", with: "password"
    click_on "Login"
  end
end
