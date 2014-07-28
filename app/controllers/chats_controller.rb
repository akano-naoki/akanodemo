class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  # GET /chats.json
  def index
    set_name
    respond_to do |format|
      format.html { render :index }
      format.json {
        chats_json = Chat.all.limit(10).order("created_at DESC").map{|c|
          {:name => c.name, :comment => c.comment, :created_at => c.created_at}
        }.to_json
        render json: chats_json
      }
    end
  end

  # GET /chats/new
  def new
    set_name
    respond_to do |format|
      format.json {
        render json: "[]"
      }
    end
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)
    @chat.datetime = Time.now

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:name, :comment)
    end

    def set_name
      if params[:name]
        @name = params[:name]
      elsif session[:name].present?
        @name = session[:name]
      else
        @name = "no_name"
      end
      session[:name] = @name
    end
end
