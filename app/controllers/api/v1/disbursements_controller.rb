class Api::V1::DisbursementsController < ApplicationController

  def index
    begin
      @week_start = Date.parse(params[:week_start]) if params[:week_start].present?
      @week_end = Date.parse(params[:week_end]) if params[:week_end].present?

      #fetching the data of disbursements
      if params[:merchant_id].present? && @week_start.present? && @week_end.present?
        @disbursements = { status: 200, data: Disbursement.with_specific_merchant(params[:merchant_id],@week_start, @week_end)}
      elsif @week_start.present? && @week_end.present?
        @disbursements = {status: 200, data: Disbursement.with_all_merchant(@week_start, @week_end)}
      else
        @disbursements = { :error => 'Both dates are required.' ,  status: 400}
      end
    rescue StandardError => exception
      #In case of any exception/error
      @disbursements = { :error => exception ,  :status => 400}
    end
    
    render json: @disbursements
  end

  
end 
