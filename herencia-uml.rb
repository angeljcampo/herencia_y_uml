class Appointment
attr_reader :location, :purpose, :hour, :min

  def initialize(location, purpose, hour, min)
    @location = location
    @purpose = purpose
    @hour = hour
    @min = min
  end
end

class MonthlyAppointment < Appointment

  attr_reader :day

  def initialize(location, purpose, hour, min,day)
    super(location,purpose,hour,min)
    @day = day
  end

  def occurs_on?(dias)
    if dias == self.day
      true
    else
      false
    end
  end

  def to_s
    "Reunion mensual en #{location} sobre #{purpose} el dia #{day} a la(s) #{hour}:#{min}"
  end

  
end


class DailyAppointment < Appointment
  def occurs_on?(horas,minutos)
    if horas == self.hour && minutos == self.min
      true
    else
      false
    end
  end
  
  def to_s
    "Reunion diaria en #{location} sobre #{purpose} a la(s) #{hour}:#{min}"
  end
end


class OneTimeAppointment < Appointment
  attr_reader :day, :month, :year

    def initialize(location, purpose, hour, min,day,month,year)
    super(location, purpose, hour, min)
    @day = day
    @month = month
    @year = year
    end
    def occurs_on?(dia,mes,ano)
      if dia == self.day && mes == self.month && ano == self.year
        true
      else
        false
      end
    end
    
    def to_s
      "Reunion unica en #{location} sobre #{purpose} el #{day}/#{month}/#{year} a la(s) #{hour}:#{min}"
    end

end

reunion1 = OneTimeAppointment.new('DesafioLatam','Trabajo',14,30,4,6,2019)

reunion2 = DailyAppointment.new('DesafioLatam','Educacion',8,15)

reunion3 = MonthlyAppointment.new('NASA','Aliens',8,15,23)

puts reunion1
puts reunion2
puts reunion3

