def chat_bot_wether(a_question)

    weather_news = "https://weathernews.jp/onebox/"

    if a_question.match?(/(今日の天気は？|今日|天気).*/i)

        p weather_news

    end

end