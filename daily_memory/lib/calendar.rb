require 'date'

class Calendar
  head = Date.today.strftime("%B %Y")
  year = Date.today.year
  mon = Date.today.mon
  day = Date.today.day
  firstday_wday = Date.new(year,mon,1).wday
  lastday_date = Date.new(year,mon,-1).day
  week = %w(Su Mo Tu We Th Fr Sa)
  
  puts head.center(20)
  puts week.join(" ")

  wday = firstday_wday
  (1..lastday_date).each do |date|
    print date.to_s.rjust(2) + " "
    wday = wday+1
    if wday%7==0
      print "\n"
    end
  end
  if wday%7!=0
    print "\n"
  end
  puts "今日は、#{year}年#{mon}月#{day}日です。"
  print '今日の日記を書きますか？(y/n): '
  write_answer = gets.chomp
  case write_answer
  when 'y' 
    puts '今日は何しましたか？'
    do_answer = gets.chomp
    if !File.exist?('memory.txt')
      File.open('memory.txt', 'w') do |file|
        file.puts("#{year}年#{mon}月#{day}日は何をしましたか: #{do_answer}")
      end
    else
      File.open('memory.txt', 'a') do |file|
        file.puts("#{year}年#{mon}月#{day}日は何をしましたか: #{do_answer}")
      end
    end
    puts 'どうでしたか？'
    how_answer = gets.chomp
    File.open('memory.txt', 'a') do |file|
      file.puts("どうでしたか: #{how_answer}")
    end
  when 'n'
    puts '明日も待っています。'
  else
    puts 'yかnでよろしくお願いします。'
  end
end