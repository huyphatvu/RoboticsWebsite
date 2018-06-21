require_relative '../test_helper'

class ComfyReferenceTest < ActiveSupport::TestCase

  def test_fixtures_validity
    ComfyReference.all.each do |comfy_reference|
      assert comfy_reference.valid?, comfy_reference.errors.inspect
    end
  end

  def test_validation
    comfy_reference = ComfyReference.new
    assert comfy_reference.invalid?
    assert_equal [:description], comfy_reference.errors.keys
  end

  def test_creation
    assert_difference 'ComfyReference.count' do
      ComfyReference.create(
        description: 'test description',
      )
    end
  end
end
