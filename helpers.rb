require 'lib/calendar'
require 'lib/array_ext'

helpers do
  def make_link(url, title, description)
    haml :_link, :locals => { :url => url, :title => title, :description => description }, :layout => false
  end

  def display_calendar(year, month)
    haml :calendario, :locals => { :calendar => Calendar.new(year, month) }
  end

  def month_name(month)
    MONTH_NAMES[month]
  end

  MONTH_NAMES = {
     1 => "Enero",
     2 => "Febrero",
     3 => "Marzo",
     4 => "Abril",
     5 => "Mayo",
     6 => "Junio",
     7 => "Julio",
     8 => "Agosto",
     9 => "Setiembre",
    10 => "Octubre",
    11 => "Noviembre",
    12 => "Diciembre"
  }
end
