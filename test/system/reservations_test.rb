require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Customer", with: @reservation.customer_id
    fill_in "Number of guests", with: @reservation.number_of_guests
    fill_in "Reservation date", with: @reservation.reservation_date
    fill_in "Status", with: @reservation.status
    fill_in "Table", with: @reservation.table_id
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Customer", with: @reservation.customer_id
    fill_in "Number of guests", with: @reservation.number_of_guests
    fill_in "Reservation date", with: @reservation.reservation_date
    fill_in "Status", with: @reservation.status
    fill_in "Table", with: @reservation.table_id
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    click_on "Destroy this reservation", match: :first

    assert_text "Reservation was successfully destroyed"
  end
end
