# encoding: Windows-1251

puts "#{ARGV[0]}, greetings!"
puts "����� ���� ��� �������?"
x = STDIN.gets.chomp
case x
when "Ruby" 
puts "#{ARGV[0]}, �������!"
when "Russian" 
puts "#{ARGV[0]}, ������� ��������� � ������ ���������..."
when "Python" 
puts "#{ARGV[0]}, ��-�� �� ��� �������� ������. �� ������, ����� ����� Ruby."
when "C++" 
puts "#{ARGV[0]}, ������, �������, �������, �� ����� ��� ����� ����� Ruby."
when "Assembler" 
puts "#{ARGV[0]}, �� ��� ���� �� ������, ���� ����� Ruby. ����� ������."
else
puts "#{ARGV[0]}, ���, ����� ����� Ruby"
end
puts "������� ������� Ruby:"
y = STDIN.gets.chomp
eval y
puts "������� ������� ��:"
z = STDIN.gets
system(z)