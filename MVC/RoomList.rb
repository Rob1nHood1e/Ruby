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

    def write_list_YAML
      File.open("rooms.yml", "w:utf-8") { |file| file.write(@room_list.to_yaml) }
    end
  
    def read_list_YAML
      @room_list = YAML::load(File.open('rooms.yml', 'r:UTF-8'))
    end

    def write_list_JSON
      File.open("rooms.json","w:UTF-8") do |file|
        tempHash = {}
        @room_list.each do |room|
          tempHash[id] = { 
            "id": room.id,
            "name": room.name,
            "guests_num": room.guests_num,
            "comf_lvl": room.comf_lvl,
            "price": room.price,
            "description": room.description,
          }
        end
        file.write(JSON.pretty_generate(tempHash))
      end
    end
  
    def read_list_JSON
      File.open("rooms.json", 'r:UTF-8') do |file|
        data = JSON.parse(file.read)
        data.each do |key, value|
          room = Room.new(value["id"], value["name"], value["guests_num"], value["comf_lvl"],
            value["price"], value["description"])
          add(room)
        end
      end
    end

    def read_db
      @room_list = DB.get_instance.read_list
    end
  
    def add_to_db(id, name, guests_num, comf_lvl, price, description)
      DB.get_instance.add_room(id, name, guests_num, comf_lvl, price, description)
    end
  
    def delete_from_db(room)
      DB.get_instance.delete_room(room)
      @room_list = []
      read_db
    end
end
