require "test_helper"

class CreateDeliverablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_deliverable = create_deliverables(:one)
  end

  test "should get index" do
    get create_deliverables_url
    assert_response :success
  end

  test "should get new" do
    get new_create_deliverable_url
    assert_response :success
  end

  test "should create create_deliverable" do
    assert_difference("CreateDeliverable.count") do
      post create_deliverables_url, params: { create_deliverable: { contract_id: @create_deliverable.contract_id, destination_symbol: @create_deliverable.destination_symbol, trade_symbol: @create_deliverable.trade_symbol, units_fulfilled: @create_deliverable.units_fulfilled, units_required: @create_deliverable.units_required } }
    end

    assert_redirected_to create_deliverable_url(CreateDeliverable.last)
  end

  test "should show create_deliverable" do
    get create_deliverable_url(@create_deliverable)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_deliverable_url(@create_deliverable)
    assert_response :success
  end

  test "should update create_deliverable" do
    patch create_deliverable_url(@create_deliverable), params: { create_deliverable: { contract_id: @create_deliverable.contract_id, destination_symbol: @create_deliverable.destination_symbol, trade_symbol: @create_deliverable.trade_symbol, units_fulfilled: @create_deliverable.units_fulfilled, units_required: @create_deliverable.units_required } }
    assert_redirected_to create_deliverable_url(@create_deliverable)
  end

  test "should destroy create_deliverable" do
    assert_difference("CreateDeliverable.count", -1) do
      delete create_deliverable_url(@create_deliverable)
    end

    assert_redirected_to create_deliverables_url
  end
end
