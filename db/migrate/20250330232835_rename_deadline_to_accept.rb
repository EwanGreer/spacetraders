class RenameDeadlineToAccept < ActiveRecord::Migration[8.0]
  def change
    rename_column :contracts, :deadline_to_accept, :deadlineToAccept
    rename_column :contracts, :payment_on_accepted, :paymentOnAccepted
    rename_column :contracts, :payment_on_fulfilled, :paymentOnFulfilled
  end
end
