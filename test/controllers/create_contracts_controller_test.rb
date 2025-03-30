require "test_helper"

class CreateContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_contract = create_contracts(:one)
  end

  test "should get index" do
    get create_contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_create_contract_url
    assert_response :success
  end

  test "should create create_contract" do
    assert_difference("CreateContract.count") do
      post create_contracts_url, params: { create_contract: { accepted: @create_contract.accepted, contract_id: @create_contract.contract_id, contract_type: @create_contract.contract_type, deadline_to_accept: @create_contract.deadline_to_accept, expiration: @create_contract.expiration, faction_symbol: @create_contract.faction_symbol, fulfilled: @create_contract.fulfilled, payment_on_accepted: @create_contract.payment_on_accepted, payment_on_fulfilled: @create_contract.payment_on_fulfilled, terms: @create_contract.terms, terms_deadline: @create_contract.terms_deadline } }
    end

    assert_redirected_to create_contract_url(CreateContract.last)
  end

  test "should show create_contract" do
    get create_contract_url(@create_contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_contract_url(@create_contract)
    assert_response :success
  end

  test "should update create_contract" do
    patch create_contract_url(@create_contract), params: { create_contract: { accepted: @create_contract.accepted, contract_id: @create_contract.contract_id, contract_type: @create_contract.contract_type, deadline_to_accept: @create_contract.deadline_to_accept, expiration: @create_contract.expiration, faction_symbol: @create_contract.faction_symbol, fulfilled: @create_contract.fulfilled, payment_on_accepted: @create_contract.payment_on_accepted, payment_on_fulfilled: @create_contract.payment_on_fulfilled, terms: @create_contract.terms, terms_deadline: @create_contract.terms_deadline } }
    assert_redirected_to create_contract_url(@create_contract)
  end

  test "should destroy create_contract" do
    assert_difference("CreateContract.count", -1) do
      delete create_contract_url(@create_contract)
    end

    assert_redirected_to create_contracts_url
  end
end
