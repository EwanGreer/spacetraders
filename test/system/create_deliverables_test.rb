require "application_system_test_case"

class CreateDeliverablesTest < ApplicationSystemTestCase
  setup do
    @create_deliverable = create_deliverables(:one)
  end

  test "visiting the index" do
    visit create_deliverables_url
    assert_selector "h1", text: "Create deliverables"
  end

  test "should create create deliverable" do
    visit create_deliverables_url
    click_on "New create deliverable"

    fill_in "Contract", with: @create_deliverable.contract_id
    fill_in "Destination symbol", with: @create_deliverable.destination_symbol
    fill_in "Trade symbol", with: @create_deliverable.trade_symbol
    fill_in "Units fulfilled", with: @create_deliverable.units_fulfilled
    fill_in "Units required", with: @create_deliverable.units_required
    click_on "Create Create deliverable"

    assert_text "Create deliverable was successfully created"
    click_on "Back"
  end

  test "should update Create deliverable" do
    visit create_deliverable_url(@create_deliverable)
    click_on "Edit this create deliverable", match: :first

    fill_in "Contract", with: @create_deliverable.contract_id
    fill_in "Destination symbol", with: @create_deliverable.destination_symbol
    fill_in "Trade symbol", with: @create_deliverable.trade_symbol
    fill_in "Units fulfilled", with: @create_deliverable.units_fulfilled
    fill_in "Units required", with: @create_deliverable.units_required
    click_on "Update Create deliverable"

    assert_text "Create deliverable was successfully updated"
    click_on "Back"
  end

  test "should destroy Create deliverable" do
    visit create_deliverable_url(@create_deliverable)
    click_on "Destroy this create deliverable", match: :first

    assert_text "Create deliverable was successfully destroyed"
  end
end
