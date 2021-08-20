class Room
  attr_reader :id,:name,:guests_num, :comf_lvl,:price,:description
  def initialize(id, name, guests_num, comf_lvl, price, description)
    self.id = id
    self.name= name
    self.comf_lvl= comf_lvl
    self.guests_num= guests_num
    self.price= price
    self.description= description
  end

  def id=(new_id)
    @id=Room.id_format(new_id)
  end

  def name=(new_name)
    @name=Room.name_format(new_name)
  end

  def comf_lvl=(new_comf_lvl)
    @comf_lvl=Room.comf_lvl_format(new_comf_lvl)
    # @comf_lvl=new_comf_lvl
  end

  def guests_num=(new_guests_num)
    @guests_num=Room.guests_num_format(new_guests_num)
    # @guests_num=new_guests_num
  end

  def price=(new_price)
    @price=Room.price_format(new_price)
  end

  def description=(new_description)
    @description = new_description
  end


  def self.id_check(id)
    id=~/[0-9]+/
  end

  def self.name_check(name)
    name=~/[а-яА-Я][\s-]?[а-яА-Я]+/
  end

  def self.comf_lvl_check(comf_lvl)
    comf_lvl=~/^Люкс$|^Полулюкс$|^Эконом$/
  end

  def self.guests_num_check(guests_num)
    guests_num=~/^[0-9]$/
  end

  def self.price_check(price)
    price=~/[0-9]+/
  end


  def self.price_format(price)
    if price_check(price)
      s = price + ' ' + 'руб.'
      return s
    else
      raise ArgumentValueError.new("Неверный формат цены")
    end
  end

  def self.name_format(name)
    if name_check(name)
      if(name.include? '-')
        return name.split('-').map{|el| el.capitalize}.join('-')
      elsif (name.include? ' ')
        return name.split(' ').map{|el| el.capitalize}.join(' ')
      else
        return name.capitalize
      end
    else
      raise ArgumentValueError.new("Неверный формат названия комнаты")
    end
  end

  def self.guests_num_format(guests_num)
    if guests_num_check(guests_num)
      s = guests_num  + '-х местный'
      return s
    else
      raise ArgumentValueError.new("Неверный формат вместимости")
    end
  end

  def self.comf_lvl_format(comf_lvl)
    if comf_lvl_check(comf_lvl)
      return comf_lvl
    else
      raise ArgumentValueError.new("Неверный формат уровня комфорта")
    end
  end

  def self.id_format(id)
    if id_check(id)
      return id
    else
      raise ArgumentValueError.new("Неверный формат номера")
    end
  end

  class ArgumentValueError < StandardError
    def initialize(msg = "ArgumentValueError")
      super msg
    end
  end



  def to_s
    "Номер: #{id()}; Название: #{name()}; Вместимость: #{guests_num()}; Уровень комфорта: #{comf_lvl()}; Цена: #{price()}; Описание: #{description()}"  
  end

end
