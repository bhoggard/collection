module ApplicationHelper
  # browser bar titles
  def title(title)
    content_for(:title) { title }
  end

  def work_date(work)
    return work.work_display_date unless work.work_display_date.blank?
    work.work_year || 'date unknown'
  end

  def show_work_info(field)
    value = @work[field]
    return if value.blank?
    capture do
      concat value
      concat tag(:br)
    end
  end

  def textilize_without_paragraph(text)
    RedCloth.new(text, [:lite_mode]).to_html
  end

  def blank_image_url
    '/pixel.gif'
  end

  def show_work_images
    if @admin || @work.artist.show_large_images?
      partial_path = 'works/image_display'
    else
      partial_path = 'works/thumb_display'
    end
    render partial: partial_path,
           collection: @work.images,
           as: :image
  end

  def alt_text
    [@work.artist.name, @work.title].reject(&:blank?).join(', ')
  end
end
