require "application_system_test_case"

class CatesTest < ApplicationSystemTestCase
  setup do
    @cate = cates(:one)
  end

  test "visiting the index" do
    visit cates_url
    assert_selector "h1", text: "Cates"
  end

  test "should create cate" do
    visit cates_url
    click_on "New cate"

    fill_in "Cate name", with: @cate.cate_name
    fill_in "Description", with: @cate.description
    click_on "Create Cate"

    assert_text "Cate was successfully created"
    click_on "Back"
  end

  test "should update Cate" do
    visit cate_url(@cate)
    click_on "Edit this cate", match: :first

    fill_in "Cate name", with: @cate.cate_name
    fill_in "Description", with: @cate.description
    click_on "Update Cate"

    assert_text "Cate was successfully updated"
    click_on "Back"
  end

  test "should destroy Cate" do
    visit cate_url(@cate)
    click_on "Destroy this cate", match: :first

    assert_text "Cate was successfully destroyed"
  end
end
