require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:one)
  end

  test "visiting the index" do
    visit contracts_url
    assert_selector "h1", text: "Contracts"
  end

  test "should create contract" do
    visit contracts_url
    click_on "New contract"

    check "Accepted" if @contract.accepted
    fill_in "Contract", with: @contract.contract_id
    fill_in "Contract type", with: @contract.contract_type
    fill_in "Deadline to accept", with: @contract.deadline_to_accept
    fill_in "Expiration", with: @contract.expiration
    fill_in "Faction symbol", with: @contract.faction_symbol
    check "Fulfilled" if @contract.fulfilled
    fill_in "Payment on accepted", with: @contract.payment_on_accepted
    fill_in "Payment on fulfilled", with: @contract.payment_on_fulfilled
    fill_in "Terms", with: @contract.terms
    fill_in "Terms deadline", with: @contract.terms_deadline
    click_on "Create Contract"

    assert_text "Contract was successfully created"
    click_on "Back"
  end

  test "should update Contract" do
    visit contract_url(@contract)
    click_on "Edit this contract", match: :first

    check "Accepted" if @contract.accepted
    fill_in "Contract", with: @contract.contract_id
    fill_in "Contract type", with: @contract.contract_type
    fill_in "Deadline to accept", with: @contract.deadline_to_accept.to_s
    fill_in "Expiration", with: @contract.expiration.to_s
    fill_in "Faction symbol", with: @contract.faction_symbol
    check "Fulfilled" if @contract.fulfilled
    fill_in "Payment on accepted", with: @contract.payment_on_accepted
    fill_in "Payment on fulfilled", with: @contract.payment_on_fulfilled
    fill_in "Terms", with: @contract.terms
    fill_in "Terms deadline", with: @contract.terms_deadline.to_s
    click_on "Update Contract"

    assert_text "Contract was successfully updated"
    click_on "Back"
  end

  test "should destroy Contract" do
    visit contract_url(@contract)
    click_on "Destroy this contract", match: :first

    assert_text "Contract was successfully destroyed"
  end
end
