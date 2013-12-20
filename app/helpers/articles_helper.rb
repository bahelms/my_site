module ArticlesHelper
  def published_date(date)
    date.strftime('%B %-d, %Y')
  end

  def time_zone(time)
    if time.dst?
      time = time + 1.hour
    end
    time
  end
end
