OpenID authentication engine requires Rails 4.1.0 or above.

## Configuring OpenID Authentication

Add the following to the `Gemfile`:
<pre>gem 'open_id_authentication', '~> 0.1'</pre>

Add the following to `config/application.rb`:
<pre>config.railties_order = [OpenIdAuthentication::Engine, :main_app, :all]</pre>

as the first line after
<pre>class Application < Rails::Application</pre>

## Using OpenID Authentication
Create a link in a view that looks like the following:
<pre>
= link_to "OpenID Login", open_id_connect_path(url: "<b>OpenID Provider URL</b>", redirect: "<b>Redirect URL</b>")
</pre>

`url` is a required parameter and specifies the URL of the OpenID provider. For example, for Google, you could set this to `"https://www.google.com/accounts/o8/id"`.

`redirect` is an optional parameter. It is set to a URL within your application where the browser will redirect after a successful or failed OpenID authentication with the OpenID provider.


Example:
<pre>
- google_url = "https://www.google.com/accounts/o8/id"
= link_to "OpenID Login", open_id_connect_path(url: google_url, redirect: root_url)
</pre>

### Default Behavior
If the `redirect` parameter is not specified, the user will be redirected back to the same location. On a successful login, `session[:open_id_data]` will be set to the data returned by the OpenID provider. This data contains the email address and full name of the user and can be accessed as follows:

<pre>
open_id_data = session[:open_id_data]
email = open_id_data['email']
name = open_id_data['fullname']
</pre> 

### Customized Behavior
If you want a custom behavior instead of the default behavior outlined above, you can define an `on_open_id_login` method in your application controller, which will be called on a successful login with the returned OpenID data.

No further processing will be done. You will be responsible for terminating this method with a response.

An example of using this in conjunction with the `user_authentication` gem is as follows:

<pre>
class ApplicationController < ActionController::Base
  protect_from_forgery

  def on_open_id_login(data)
    email = Mail::Address.new(data['email'])
    if email.domain != 'example.com'
      return head :forbidden
    end

    account = Account.find_or_create_by! email: email.address
    session[:account_id] = account.id
    set_current_account

    redirect_to params[:redirect] || root_path
  end
end
</pre>