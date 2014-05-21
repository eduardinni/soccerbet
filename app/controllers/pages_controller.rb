class PagesController < ApplicationController
  skip_before_filter :user_agreed_rules?
  
  def rules
  end
  
  def agree_rules
    current_user.rules_agreed = true
    if current_user.save
        return redirect_to root_url, notice: t('flash.rules_agreed')
    end
  end
end
