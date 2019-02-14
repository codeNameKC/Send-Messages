class SendEmailsController < ApplicationController

  # GET /send_emails/new
  def new
    @send_email = SendEmail.new
  end

  # POST /send_emails
  # POST /send_emails.json
  def create
    @send_email = SendEmail.new(send_email_params)

    from = SendGrid::Email.new(email: @send_email.Email)
    to = SendGrid::Email.new(email: @send_email.Email)
    subject = 'Sending with SendGrid is Fun'
    content = SendGrid::Content.new(type: 'text/plain', value: @send_email.Message)
    mail = SendGrid::Mail.new(from, subject, to, content)
  
    sg = SendGrid::API.new(api_key: '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')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers

    respond_to do |format|
      if @send_email.save
        format.json { render json: 'Send email was successfully created.', status: :created, location: @send_email }
      else
        format.html { render :new }
        format.json { render json: @send_email.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def send_email_params
      params.require(:send_email).permit(:Email, :Message)
    end
end
