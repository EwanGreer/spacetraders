class ContractSyncService
  def self.sync(contract_data, agent)
    ActiveRecord::Base.transaction do
      contract = Contract.find_or_initialize_by(external_id: contract_data["id"])
      contract.assign_attributes(
        faction_symbol:     contract_data["factionSymbol"],
        contract_type:      contract_data["type"],
        accepted:           contract_data["accepted"],
        fulfilled:          contract_data["fulfilled"],
        expiration:         contract_data["expiration"],
        deadline_to_accept: contract_data["deadlineToAccept"],
        terms_deadline:     contract_data["terms"]["deadline"],
        agent:              agent
      )
      contract.save!

      if (payment_data = contract_data["terms"]["payment"]).present?
        payment = Payment.find_or_initialize_by(contract: contract)
        payment.assign_attributes(
          payment_on_accepted:  payment_data["onAccepted"],
          payment_on_fulfilled: payment_data["onFulfilled"]
        )
        payment.save!
      end

      if (deliveries = contract_data["terms"]["deliver"]).present?
        delivery_data = deliveries.first
        delivery = contract.delivery || contract.build_delivery
        delivery.assign_attributes(
          trade_symbol:       delivery_data["tradeSymbol"],
          destination_symbol: delivery_data["destinationSymbol"],
          units_required:     delivery_data["unitsRequired"],
          units_fulfilled:    delivery_data["unitsFulfilled"]
        )
        delivery.save!
      end

      contract
    end
  end
end
