# じゃんけん結果
def puts_janken(who, num)
  case num
  when 0
    puts "#{who}:グーを出しました"
  when 1
    puts "#{who}:チョキを出しました"
  when 2
    puts "#{who}:パーを出しました"
  end
end

#  あっち向いてホイ結果
def puts_look(who, num)
  case num
  when 0
    puts "#{who}:上"
  when 1
    puts "#{who}:下"
  when 2
    puts "#{who}:左"
  when 3
    puts "#{who}:右"
  end
end


# じゃんけん
def janken
  puts "じゃんけん♪"
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  finished = false
  case_num = $stdin.gets.chomp.to_i
  random_num = rand(0..2)
  
  #分岐
  win_lose_num = (case_num - random_num) % 3
  case case_num
  when 0, 1, 2
    puts "---------------"
    puts_janken("あなた", case_num)
    puts_janken("相手", random_num)
    case win_lose_num
    when 0
      puts "あいこです"
    when 1
      puts "じゃんけん負け"
      win_lose = "負け"
      finished = look(win_lose)
    when 2
      puts "じゃんけん勝ち"
      win_lose = "勝ち"
      finished = look(win_lose)
    end
  when 4
    puts "戦わない"
    finished = true
  else
    puts "0から2までの値を、半角で入力してください"
  end
  return finished
end

# あっちむいてホイ
def look(win_lose)
  puts "あっち向いて〜♪"
  puts "0(上)1(下)2(左)3(右)"
  finished = false
  case_num = $stdin.gets.chomp.to_i
  random_num = rand(0..3)
  
  puts_look("あなた", case_num)
  puts_look("相手", random_num)
  
  #分岐
  if 0 <= case_num && case_num <= 3
    if case_num == random_num
      puts "勝敗がつきました"
      puts "あなたの#{win_lose}"
      finished = true
    else
      puts "勝敗がつきませんでした"
    end
  else
    puts "値が間違えています"
  end
  return finished
end

# ループ処理
def loop_janken
  finished = false
  until finished do
    finished = janken
  end
end

loop_janken