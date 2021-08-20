require_relative "Room"

class ListRoom
  attr_accessor :room_list
  def initialize
    @room_list = []
  end

  def add(room)
    @room_list << room
  end

  def delete_room(room)
    @room_list.delete(room)
  end

  def search(data)
    @room_list.each{ |room| if [room.id, room.name,  room.guests_num, room.comf_lvl, room.price, room.description].include? data
    return room
    else return nil
    end
    }
    end


    def write_file
      file = File.open('room.txt', 'a') {|file|
        @room_list.each{|room|
          file.write(room.id << ' || ' << room.name << ' || ' << room.guests_num[0] << ' || ' << room.comf_lvl << ' || ' <<
                       room.price.split(' ')[0] << ' || ' << room.description)
          file.write("\n")
  
        }
      }
    end
  
    def read_file
      file = File.open('room.txt',  'r:UTF-8')
      rooms = file.read
      rooms = rooms.force_encoding("cp866")
      rooms = rooms.split("\n")
      rooms.each do |room|
        room = room.split(' || ')
        room.map { |elem| elem.force_encoding("UTF-8") }
        add(Room.new(room[0], room[1], room[2], room[3], room[4], room[5]))
      end
    end
end
