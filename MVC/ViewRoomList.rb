require_relative 'Room'
require_relative 'RoomList'

class ViewRoomList
  attr_accessor :room_list
  def initialize (room_list = ListRoom.new())
    @room_list = room_list
  end

  def add_room_list
    puts "Введите данные номера: "
    puts "Номер: "
    id = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Название: "
    name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Вместимость: "
    guests_num = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Уровень комфорта: "
    comf_lvl = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Цена: "
    price = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Описание:"
    description = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    room = Room.new(id, name, guests_num, comf_lvl, price, description)

    @room_list.add(room)
  end

  def delete_room
    puts "Введите название номера, который хотите удалить: "
    target_room= STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    room = @room_list.search(target_room)
    puts(room.to_s)
    puts("Вы уверены, что хотите удалить номер? [Да/Нет]")
    answer = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).downcase
    @room_list.delete_room(room) if answer == "да"
  end


  def show_room_list
    puts "Список номеров: "
    puts @room_list.room_list
  end

  def file_export
  @room_list.write_file()
  end

  def file_read
  @room_list.read_file
  end

  def search_room
          puts "Введите название или цену номера:"
          value =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
          if room.name_check value
              name = room.name_format(value)
              room = @room_list.search(name)
          end
          if room.price_check value
            price = room.price_format(value)
            room = @room_list.search(price)
          end
          puts room
      end
  end


rooml = ViewRoomList.new()
def menu room
  puts "1. Добавить номер"
  puts "2. Удалить номер"
  puts "3. Посмотреть список номеров"
  puts "4. Запись в файл"
  puts "5. Чтение из файла"
  puts "6. Поиск номера"
  puts "7. Закрыть программу."
  method =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
  case method
  when "1"
    room.add_room_list()
  when "2"
    room.delete_room()
  when "3"
    room.show_room_list()
  when "4"
    room.file_export()
  when "5"
    room.file_read()
  when "6"
    room.search_room()
  when "7"
    exit()
  end
  menu(room)
end
menu(rooml)
