module ArticlesHelper
  def published_date(date)
    date.strftime('%B %-d, %Y')
  end
end
