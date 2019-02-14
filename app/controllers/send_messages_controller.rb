class SendMessagesController < ApplicationController
  before_action :set_send_message, only: [:show, :edit, :update, :destroy]

  # GET /send_messages
  # GET /send_messages.json
  def index
    @send_messages = SendMessage.all
  end

  # GET /send_messages/1
  # GET /send_messages/1.json
  def show
  end

  # GET /send_messages/new
  def new
    @send_message = SendMessage.new
  end

  # GET /send_messages/1/edit
  def edit
  end

  # POST /send_messages
  # POST /send_messages.json
  def create
    @send_message = SendMessage.new(send_message_params)
    
    client = Nexmo::Client.new(
      api_key: '2bbc3633',
      api_secret: 'i3x12mrylgDbHKWC'
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

  # PATCH/PUT /send_messages/1
  # PATCH/PUT /send_messages/1.json
  def update
    respond_to do |format|
      if @send_message.update(send_message_params)
        format.html { redirect_to @send_message, notice: 'Send message was successfully updated.' }
        format.json { render :show, status: :ok, location: @send_message }
      else
        format.html { render :edit }
        format.json { render json: @send_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_messages/1
  # DELETE /send_messages/1.json
  def destroy
    @send_message.destroy
    respond_to do |format|
      format.html { redirect_to send_messages_url, notice: 'Send message was successfully destroyed.' }
      format.json { head :no_content }
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
