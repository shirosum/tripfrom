class ApplicationMailer < ActionMailer::Base
  # 送信先のメールアドレス　defaultでよければこのままえいい　送信先の指定をしたければ変更する
  default from: 'from@example.com'
  layout 'mailer'
end
