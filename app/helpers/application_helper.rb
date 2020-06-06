module ApplicationHelper
  def conference(year)
    t("conference.#{year > 2014 ? 'step' : 'acts'}", year: year)
  end
end
