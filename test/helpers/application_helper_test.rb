require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "work date with no date" do
    work = Work.new
    assert_equal "date unknown", work_date(work)
  end

  test "work date with a work_year" do
    work = Work.new(work_year: 1997)
    assert_equal 1997, work_date(work)
  end

  test "work date with a work_display_date" do
    work = Work.new(work_year: 1997, work_display_date: "1997-2000")
    assert_equal "1997-2000", work_date(work)
  end

  test "textilize_without_paragraph" do
    assert_equal "<em>Untitled</em>", textilize_without_paragraph("_Untitled_")
  end
end
