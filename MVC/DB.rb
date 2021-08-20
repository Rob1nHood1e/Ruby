require 'mysql2'
require_relative 'Tour'

class DB
  @@instance = nil
  def initialize
    @connection = Mysql2::Client.new(
      :host => 'localhost',
      :username => 'root',
      :password => '******',
      :database => 'hotel')
  end

  def self.get_instance
    if @@instance == nil
      @@instance = DB.new
    end
    @@instance
  end

  def read_list
    results = @connection.query("SELECT * FROM rooms")
    list_rooms = []
    results.each do |row|
        room = Room.new(row['id'], row['Name'], row['GuestsNumber'], row['ComfortClass'],
                           row['Price'], row['Desciption'])
        list_rooms << room
    end
    list_rooms
  end

  def change_room(room)
    query_str = "UPDATE rooms
                           SET id = '#{room.id}',
                               name = '#{room.name}',
                               desciption = '#{room.desciption}',
                               price = '#{room.price}',
                               guestsnumber =' #{room.guests_num}',
                               comfortclass = '#{room.comf_lvl}',
                           WHERE name = #{room.name}"
    @connection.query(query_str)
  end

  def add_room(id, name, guests_num, comf_lvl, price, desciption)
      @connection.query("INSERT INTO `hotel`.`rooms` (`id`, `name` ,`guestsnumber` ,`comfortclass`
                                   `price` ,`desciption`)
                                 VALUES ('#{id}', '#{name}', '#{guests_num}', '#{comf_lvl}', 
                                  '#{price}', '#{desciption}')")
  end  
  
  def delete_room(room)
    @connection.query("DELETE FROM rooms WHERE name = '#{room.name}'")
  end
end
