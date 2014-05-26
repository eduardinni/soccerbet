class PasswordsController < Devise::PasswordsController
  skip_before_filter :user_agreed_rules?
end