include ApplicationHelper

def published_date(date)
  date.strftime('%B %-d, %Y')
end
