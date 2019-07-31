require 'nokogiri'
require 'open-uri'
require 'csv'

schedule = Array.new
stockMeeting = Array.new 

begin 
# 対象のURL
  url = 'https://www.fujifilmholdings.com/ja/investors/index.html'
  doc = Nokogiri::HTML(open(url))
  puts doc.title

element = doc.xpath('//*[@id="contentsInner"]/div[2]/div[1]/div/div/div/div/div/div[2]/div/div[4]')

element.css('dt').each do |i|
 monthAndDay  =  i.text
 schedule.push(monthAndDay)
end

element.css('dd').each do |item|
 contents = item.text
 stockMeeting.push(contents)
end

num1 = schedule.length
num2 = stockMeeting.length
length = 0

if num1 < num2
 length = num1 
else 
 length = num2 
end

length.times do |i|
puts schedule[i]
puts stockMeeting[i]
end

 rescue => error
  puts "アクセスできませんでした"
  puts error
end 


