class SendMessagesController < ApplicationController
  before_action :set_send_message, only: [:show, :edit, :update, :destroy]

  # GET /send_messages/new
  def new
    @send_message = SendMessage.new
  end

  # POST /send_messages
  # POST /send_messages.json
  def create
    @send_message = SendMessage.new(send_message_params)
    
    client = Nexmo::Client.new(
      api_key: ENV['NEXMO_API_KEY'],
      api_secret: ENV['NEXMO_API_SECRET']
    )
    
    client.sms.send(
      from: 'Acme Inc',
      to: @send_message.PhoneNumber,
      text: @send_message.Message
    )
  
    respond_to do |format|
      if @send_message.save
        format.json { render json: 'Send email was successfully created', status: :created, location: @send_message }
      else
        format.html { render :new }
        format.json { render json: @send_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_message
      @send_message = SendMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_message_params
      params.require(:send_message).permit(:PhoneNumber, :Message)
    end
end
