require_relative '../test_helper'

class RefDataTest < ActiveSupport::TestCase

  def test_fixtures_validity
    RefData.all.each do |ref_data|
      assert ref_data.valid?, ref_data.errors.inspect
    end
  end

  def test_validation
    ref_data = RefData.new
    assert ref_data.invalid?
    assert_equal [:page_num, :label], ref_data.errors.keys
  end

  def test_creation
    assert_difference 'RefData.count' do
      RefData.create(
        page_num: 'test page_num',
        label: 'test label',
      )
    end
  end
end
