require 'lib/libs'

helpers do
  def round_td(round)
    tdclass = round.won ? "won" : "lost"
    opp = round.opponent
    result = round.result.to_s
    wonlost = round.won ? "+" : "-"
    img = ""
    img = "<img src=\"/img/stone#{round.color}.png\" alt=\"[#{round.color}]\"/> " unless round.color.empty?
    "<td class=\"round #{tdclass}\" title=\"#{opp.name} #{result}\">#{img}#{opp.ip}#{wonlost}</td>"
  end

  def partial(file, options={})
    options.merge!({ :layout => false })
    haml file, options
  end

  def show_event_dates(event)
    if event.date == event.end_date
      readable_date event.date
    else
      year = event.date.year != event.end_date.year
      month = year || (event.date.month != event.end_date.month)
      "Del #{readable_date(event.date, year, month)} al #{readable_date(event.end_date)}."
    end
  end

  def readable_date(date, year=true, month=true)
    format = "%d"
    format += " de #{months[date.month - 1]}" if month
    format += " de %Y" if year
    date.strftime format
  end

  def months
    %w(enero febrero marzo abril mayo junio julio agosto setiembre octubre noviembre diciembre)
  end

  def javascript(*scripts)
    scripts.map do |s|
      "<script src=\"/javascript/#{s.to_s}.js\" type=\"text/javascript\"></script>"
    end
  end
end
