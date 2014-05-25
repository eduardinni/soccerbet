class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :user_agreed_rules?
end