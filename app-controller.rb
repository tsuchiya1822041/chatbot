# frozen_string_literal: true

# gem 'line-bot-api'を使えるように宣言
require 'line/bot'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :validate_signature, except: %i[new create]
  def validate_signature
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    return if client.validate_signature(body, signature)

    error 400 do 'Bad Request' end
  end

  def client
    @client ||= Line::Bot::Client.new do |config|
      # ローカルで動かすだけならベタ打ちでもOK。
      config.channel_secret = 'your channel secret'
      config.channel_token = 'your channel token'
    end
  end
end
