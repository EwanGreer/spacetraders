require "application_system_test_case"

class CreateContractsTest < ApplicationSystemTestCase
  setup do
    @create_contract = create_contracts(:one)
  end

  test "visiting the index" do
    visit create_contracts_url
    assert_selector "h1", text: "Create contracts"
  end

  test "should create create contract" do
    visit create_contracts_url
    click_on "New create contract"

    check "Accepted" if @create_contract.accepted
    fill_in "Contract", with: @create_contract.contract_id
    fill_in "Contract type", with: @create_contract.contract_type
    fill_in "Deadline to accept", with: @create_contract.deadline_to_accept
    fill_in "Expiration", with: @create_contract.expiration
    fill_in "Faction symbol", with: @create_contract.faction_symbol
    check "Fulfilled" if @create_contract.fulfilled
    fill_in "Payment on accepted", with: @create_contract.payment_on_accepted
    fill_in "Payment on fulfilled", with: @create_contract.payment_on_fulfilled
    fill_in "Terms", with: @create_contract.terms
    fill_in "Terms deadline", with: @create_contract.terms_deadline
    click_on "Create Create contract"

    assert_text "Create contract was successfully created"
    click_on "Back"
  end

  test "should update Create contract" do
    visit create_contract_url(@create_contract)
    click_on "Edit this create contract", match: :first

    check "Accepted" if @create_contract.accepted
    fill_in "Contract", with: @create_contract.contract_id
    fill_in "Contract type", with: @create_contract.contract_type
    fill_in "Deadline to accept", with: @create_contract.deadline_to_accept.to_s
    fill_in "Expiration", with: @create_contract.expiration.to_s
    fill_in "Faction symbol", with: @create_contract.faction_symbol
    check "Fulfilled" if @create_contract.fulfilled
    fill_in "Payment on accepted", with: @create_contract.payment_on_accepted
    fill_in "Payment on fulfilled", with: @create_contract.payment_on_fulfilled
    fill_in "Terms", with: @create_contract.terms
    fill_in "Terms deadline", with: @create_contract.terms_deadline.to_s
    click_on "Update Create contract"

    assert_text "Create contract was successfully updated"
    click_on "Back"
  end

  test "should destroy Create contract" do
    visit create_contract_url(@create_contract)
    click_on "Destroy this create contract", match: :first

    assert_text "Create contract was successfully destroyed"
  end
end
