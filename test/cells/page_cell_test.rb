require 'test_helper'

class PageCellTest < Cell::TestCase
  test "show_company_info" do
    invoke :show_company_info
    assert_select "p"
  end
  

end
