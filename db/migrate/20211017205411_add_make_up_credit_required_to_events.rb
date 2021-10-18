class AddMakeUpCreditRequiredToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :make_up_credit_required, :boolean, default: false
  end
end
