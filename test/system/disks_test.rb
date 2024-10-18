require "application_system_test_case"

class DisksTest < ApplicationSystemTestCase
  setup do
    @disk = disks(:one)
  end

  test "visiting the index" do
    visit disks_url
    assert_selector "h1", text: "Disks"
  end

  test "should create disk" do
    visit disks_url
    click_on "New disk"

    fill_in "Category", with: @disk.category_id
    fill_in "Description", with: @disk.description
    fill_in "Name", with: @disk.name
    fill_in "Price", with: @disk.price
    click_on "Create Disk"

    assert_text "Disk was successfully created"
    click_on "Back"
  end

  test "should update Disk" do
    visit disk_url(@disk)
    click_on "Edit this disk", match: :first

    fill_in "Category", with: @disk.category_id
    fill_in "Description", with: @disk.description
    fill_in "Name", with: @disk.name
    fill_in "Price", with: @disk.price
    click_on "Update Disk"

    assert_text "Disk was successfully updated"
    click_on "Back"
  end

  test "should destroy Disk" do
    visit disk_url(@disk)
    click_on "Destroy this disk", match: :first

    assert_text "Disk was successfully destroyed"
  end
end
