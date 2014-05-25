class SessionsController < Devise::SessionsController
  skip_before_filter :user_agreed_rules?
end