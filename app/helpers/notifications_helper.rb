module NotificationsHelper
  include ActionView::Helpers::TextHelper
  
  def fb_notification_won_points(user, points, prediction_id)
    if user.provider == 'facebook'
      app = FbGraph::Application.new(ENV["FB_PUBLIC_KEY"], secret: ENV["FB_PRIVATE_KEY"])
      app.fetch

      fbuser = FbGraph::User.new(user.uid, access_token: user.oauth_token )
      fbuser.fetch

      app.notify! fbuser, template: "Enhorabuena! Has sumado #{pluralize(points, 'punto', 'puntos')}.", href: "notifications"
    end
  end
end
