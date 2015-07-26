module ApplicationHelper
  def work_date(work)
    return work.work_display_date unless work.work_display_date.blank?
    work.work_year || 'date unknown'
  end

  def home_page_work(work)
    if work.title.present?
      title = content_tag('em') do
        work.title
      end
    else
      title = nil
    end
    [work.artist.name, title, work_date(work)].compact.join(', ').html_safe
  end
end
