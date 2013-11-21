module SendBackgroundEmail
  @queue = :default

  def self.perform(from_email, options)
    #what happens when this is executed by the worker
    email_to = options['email_destination']
    email_subject = options['email_subject']
    email_body = options['email_body']


    Mail.deliver do
      to email_to
      from email_from || "test@example.com"
      subject email_subject
      body email_body
    end
  end

end
