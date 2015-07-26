module ApplicationHelper
  def work_date(work)
    return work.work_display_date unless work.work_display_date.blank?
    work.work_year || 'date unknown'
  end
end
