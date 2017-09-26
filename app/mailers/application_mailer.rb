class ApplicationMailer < ActionMailer::Base
  default from: "mg.mercyxmankind.com"
  layout 'mailer'

def new_record_notification(record)
  @record = record
  mail to: "isaacsaqib@gmail.com", subject: "Success! You did it."
end

end
