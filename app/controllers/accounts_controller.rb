# frozen_string_literal: true

class AccountsController < SecuredController
  def show
    account = Account.find(params[:id])

    account_hash = {}

    account.attributes.each do |key, value|
      camelkey = key.camelize(:lower)
      account_hash[camelkey] = value
    end

    account_hash["createdAt"] = account_hash["createdAt"].to_datetime.strftime("%Q")

    render json: account_hash.to_json
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
