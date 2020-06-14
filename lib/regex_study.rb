# https://qiita.com/jnchito/items/893c887fbf19e17d3ff9

text = <<TEXT
def hello(name)
    puts "Hello, \#{name}!"
  end
  
  hello('Alice')
            
  hello('Bob')
      
  hello('Carol')
TEXT

#puts text.scan /<option value="(\w+)"(?: selected)?>(.*)<\/option>/

#replaced = text.gsub(/<option value="(\w+)"(?: selected)?>(.*?)<\/option>/, '\1,\2')

#replaced = text.gsub(/^[ \t]+$/, '')
#puts replaced

puts "123-4567" =~ /\d{3}-\d{4}/
text = "私の誕生日は1997年7月17日です。"
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
puts m.class
puts m[:year]
puts m[:month]
puts m[:day]
# regex = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ にしておいて、 if regex =~ text は無理なので注意
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
    puts "#{year}/#{month}/#{day}"
end