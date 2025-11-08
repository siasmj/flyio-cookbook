class ApplicationMailer < ActionMailer::Base
  default from: "cookbook@flyio-cookbook.fly.dev"
  layout "mailer"
end
