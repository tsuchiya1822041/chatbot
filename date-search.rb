def chat_bot_date(a_question)
  today Date.today
  return unless a_question.match?(/(今日の日付は？|今日|日付).*/i)

  p today
end
