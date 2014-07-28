# -*- coding: utf-8 -*-
class WebsocketController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def recieve_chat_message
    # mongo_db に保存
    obj = JSON.parse(message)
    chat = Chat.new(obj)
    chat.save
    logger.debug chat.to_json
    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    broadcast_message(:websocket_chat, chat.to_json)
  end

end
