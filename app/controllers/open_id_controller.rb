class OpenIdController < ApplicationController
  skip_before_filter :authorize

  def connect
    response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        identifier: params[:url],
        required: ['email', 'fullname'],
        return_to: open_id_accept_url(redirect: params[:redirect] || root_path),
        realm: open_id_accept_url,
        method: 'GET')
    head 401
  end

  def accept
    response = request.env[Rack::OpenID::RESPONSE]
    redirect_to root_path unless response.present?

    case response.status
      when :success
        data = OpenID::SReg::Response.from_success_response(response)
        session[:open_id_data] = data
        redirect_to params[:redirect]
      when :failure
        flash[:error] = 'OpenID login failed.'
        session.delete(:open_id_data)
        redirect_to params[:redirect]
    end
  end
end
