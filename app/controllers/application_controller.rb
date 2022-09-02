class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :ue_response
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response


  private 

  def ue_response(invalid) 
    render json:{errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def not_found_response(invalid) 
    render json:{errors: [invalid.message]}, status: :unauthorized
  end
end
