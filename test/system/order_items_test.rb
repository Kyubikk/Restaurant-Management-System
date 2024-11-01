require "application_system_test_case"

class OrderItemsTest < ApplicationSystemTestCase
  setup do
    @order_item = order_items(:one)
  end

  test "visiting the index" do
    visit order_items_url
    assert_selector "h1", text: "Order items"
  end

  test "should create order item" do
    visit order_items_url
    click_on "New order item"

    fill_in "Menu item", with: @order_item.menu_item_id
    fill_in "Order", with: @order_item.order_id
    fill_in "Price", with: @order_item.price
    fill_in "Quantity", with: @order_item.quantity
    fill_in "Staff", with: @order_item.staff_id
    click_on "Create Order item"

    assert_text "Order item was successfully created"
    click_on "Back"
  end

  test "should update Order item" do
    visit order_item_url(@order_item)
    click_on "Edit this order item", match: :first

    fill_in "Menu item", with: @order_item.menu_item_id
    fill_in "Order", with: @order_item.order_id
    fill_in "Price", with: @order_item.price
    fill_in "Quantity", with: @order_item.quantity
    fill_in "Staff", with: @order_item.staff_id
    click_on "Update Order item"

    assert_text "Order item was successfully updated"
    click_on "Back"
  end

  test "should destroy Order item" do
    visit order_item_url(@order_item)
    click_on "Destroy this order item", match: :first

    assert_text "Order item was successfully destroyed"
  end
end
