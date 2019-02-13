class SendEmailsController < ApplicationController
  before_action :set_send_email, only: [:show, :edit, :update, :destroy]

  # GET /send_emails
  # GET /send_emails.json
  def index
    @send_emails = SendEmail.all
  end

  # GET /send_emails/1
  # GET /send_emails/1.json
  def show
  end

  # GET /send_emails/new
  def new
    @send_email = SendEmail.new
  end

  # GET /send_emails/1/edit
  def edit
  end

  # POST /send_emails
  # POST /send_emails.json
  def create
    @send_email = SendEmail.new(send_email_params)


    from = SendGrid::Email.new(email: @send_email.Email)
    to = SendGrid::Email.new(email: @send_email.Email)
    subject = 'Sending with SendGrid is Fun'
    content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = SendGrid::Mail.new(from, subject, to, content)
  
    sg = SendGrid::API.new(api_key: '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')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers

    respond_to do |format|
      if @send_email.save
        format.html { redirect_to @send_email, notice: 'Send email was successfully created.' }
        format.json { render :show, status: :created, location: @send_email }
      else
        format.html { render :new }
        format.json { render json: @send_email.errors, status: :unprocessable_entity }
      end
    end

    
  end

  # PATCH/PUT /send_emails/1
  # PATCH/PUT /send_emails/1.json
  def update
    respond_to do |format|
      if @send_email.update(send_email_params)
        format.html { redirect_to @send_email, notice: 'Send email was successfully updated.' }
        format.json { render :show, status: :ok, location: @send_email }
      else
        format.html { render :edit }
        format.json { render json: @send_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_emails/1
  # DELETE /send_emails/1.json
  def destroy
    @send_email.destroy
    respond_to do |format|
      format.html { redirect_to send_emails_url, notice: 'Send email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_email
      @send_email = SendEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_email_params
      params.require(:send_email).permit(:Email, :Message)
    end
end
