require 'lib/tournament'
require 'lib/augo'
require 'lib/calendar'

helpers do
  def make_link(url, title, description)
    partial :_link, :locals => { :url => url, :title => title, :description => description }
  end

  def round_td(round)
    color = round.won? ? "green" : "red"
    opp = round.opponent
    player = round.player
    result = round.result.to_s
    wonlost = round.won? ? "+" : "-"
    img = ""
    img = "<img src=\"/img/stone#{round.color}.png\">" if round.color
    "<td class=\"roundinfo\" style=\"color: #{color}\" title=\"#{opp.name} #{result}\" onMouseOver=\"highlightPlayer(#{player.ip}); highlightPlayer(#{opp.ip});\" onMouseOut=\"restorePlayer(#{player.ip}); restorePlayer(#{opp.ip});\" >#{img}#{opp.ip}#{wonlost}</td>"
  end

  def partial(file, options={})
    options.merge!({ :layout => false })
    haml file, options
  end

  def show_event_dates(event)
    if event.date == event.end_date
      readable_date event.date
    else
      "Del #{readable_date(event.date)} al #{readable_date(event.end_date)}."
    end
  end

  def readable_date(date)
    date.strftime "%d de #{months[date.month - 1]} de %Y"
  end

  def months
    %w(enero febrero marzo abril mayo junio julio agosto setiembre octubre noviembre diciembre)
  end
end
