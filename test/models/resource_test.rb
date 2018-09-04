require_relative '../test_helper'

class ResourceTest < ActiveSupport::TestCase

  def test_fixtures_validity
    Resource.all.each do |resource|
      assert resource.valid?, resource.errors.inspect
    end
  end

  def test_validation
    resource = Resource.new
    assert resource.invalid?
    assert_equal [:experiment_name, :experiment_url], resource.errors.keys
  end

  def test_creation
    assert_difference 'Resource.count' do
      Resource.create(
        experiment_name: 'test experiment_name',
        experiment_url: 'test experiment_url',
      )
    end
  end
end
