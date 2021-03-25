# encoding: Windows-1251

puts "#{ARGV[0]}, greetings!"
puts "Какой язык ваш любимый?"
x = STDIN.gets.chomp
case x
when "Ruby" 
puts "#{ARGV[0]}, подлиза!"
when "Russian" 
puts "#{ARGV[0]}, выключи компьютер и покинь аудиторию..."
when "Python" 
puts "#{ARGV[0]}, то-то ты так медленно пишешь. Ну ничего, скоро будет Ruby."
when "C++" 
puts "#{ARGV[0]}, кресты, конечно, кошерно, но скоро все равно будет Ruby."
when "Assembler" 
puts "#{ARGV[0]}, ну тут либо на пенсию, либо учить Ruby. Лучше второе."
else
puts "#{ARGV[0]}, мда, скоро будет Ruby"
end
puts "Введите команду Ruby:"
y = STDIN.gets.chomp
eval y
puts "Введите команду ОС:"
z = STDIN.gets
system(z)