class Bingo
  def self.make_bingo
    b = (1..15).to_a.sample(5)
    i = (16..30).to_a.sample(5)
    n = (31..45).to_a.sample(5)
    n[2] = ""
    g = (46..60).to_a.sample(5)
    o = (61..75).to_a.sample(5)
    bingo = " B |  I |  N |  G |  O\n"
    5.times do |number|
      [b,i,n,g,o].each do |column|
        bingo += column[number].to_s.rjust(2) + " | "
      end
      bingo[-3..-1]="\n"
    end
    return bingo
  end
  def self.delete_number(bingo)
    random = rand(1..75).to_s.rjust(2)
    puts "今回は#{random}番です。"
    if /#{random}/ =~ bingo
      puts "あなたのカードに#{random}番ありました。"
      bingo.gsub(/#{random}/, '')
    else
      puts "あなたのカードに#{random}番ありませんでした。"
    end
  end
end

my_bingo = Bingo.make_bingo
puts 'こちらがあなたのビンゴカードです。'
puts my_bingo
print 'ビンゴを始めますか？(y/n): '
answer = gets.chomp
case answer
when 'y'
  Bingo.delete_number(my_bingo)
  puts my_bingo
when 'n'
  puts 'また来てください。'
else
  puts 'yかnで答えてください。'
end
