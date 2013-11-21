class HomeController < ApplicationController

	def show
	end

  def send_email
# # cut out to use with queue

    # email_to = params['email_destination']
    # email_from = current_user.email
    # email_subject = params['email_subject']
    # email_body = params['email_body']
#     Mail.deliver do
#       to email_to
#       from email_from || "test@example.com"
#       subject email_subject
#       body email_body
#     end

    Resque.enqueue(SendBackgroundEmail, current_user.email, params)
    redirect_to root_url, notice: "Email sent"
  end

end