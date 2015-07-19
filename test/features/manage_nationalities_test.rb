require "test_helper"

class ManageNationalitiesTest < Capybara::Rails::TestCase
  def setup
    admin_login
  end

  test "index" do
    visit admin_nationalities_path
    assert_content page, nationalities(:us).name
    assert_content page, nationalities(:de).name
  end

  test "adding an new nationality" do
    visit admin_nationalities_path
    click_on "New Nationality"
    fill_in "Name", with: "Ostrobothnia"
    click_on "Create Nationality"
    assert_content page, "Nationality was successfully created."
    assert_content page, "Ostrobothnia"
  end

  test "editing a nationality" do
    visit admin_nationalities_path
    first(:link, "Edit").click
    refute_content page, "Ostrobothnia"
    fill_in "Name", with: "Ostrobothnia"
    click_on "Update Nationality"
    assert_content page, "Nationality was successfully updated."
    assert_content page, "Ostrobothnia"
  end

  test "deleting a nationality" do
    count = Nationality.count
    name = Nationality.first.name
    visit admin_nationalities_path
    assert_content page, name
    first(:link, "Delete").click
    assert_content page, "Nationality was successfully deleted."
    refute_content page, name
    assert_equal count - 1, Nationality.count
  end
end
