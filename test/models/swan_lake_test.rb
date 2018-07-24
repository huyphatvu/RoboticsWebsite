require_relative '../test_helper'

class SwanLakeTest < ActiveSupport::TestCase

  def test_fixtures_validity
    SwanLake.all.each do |swan_lake|
      assert swan_lake.valid?, swan_lake.errors.inspect
    end
  end

  def test_validation
    swan_lake = SwanLake.new
    assert swan_lake.invalid?
    assert_equal [:date], swan_lake.errors.keys
  end

  def test_creation
    assert_difference 'SwanLake.count' do
      SwanLake.create(
        date: 'test date',
      )
    end
  end
end
