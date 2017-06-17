require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../../models/deal.rb")

class TestDatabaseAssistant < MiniTest::Test

  def setup
    @deal = Deal.new({
        "id" => 1,
        "hotel_id" => 2,
        "percentage_off" => 50,
        "start_date" => "2017-01-01",
        "end_date" => "2017-05-01"
    })
  end

  def test_set_percentage__correct_value()
    @deal.set_percentage_off(70)
    assert_equal(70, @deal.percentage_off)
  end

  def test_set_percentage__incorrect_value()
    @deal.set_percentage_off(100)
    assert_equal(50, @deal.percentage_off)
    @deal.set_percentage_off(0)
    assert_equal(50, @deal.percentage_off)
  end

  def test_set_dates__correct_value()
    start_date_input = "2017-03-31"
    @deal.set_start_date(start_date_input)
    assert_equal(start_date_input, @deal.start_date.to_s)

    end_date_input = "2018-01-01"
    @deal.set_end_date(end_date_input)
    assert_equal(end_date_input, @deal.end_date.to_s)
  end

  def test_set_dates__incorrect_value()

  end

  def test_deal_active()

  end

end