$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'mocha/minitest'
require 'spdx-licenses/license'

class TestLicense < Minitest::Test
  def setup
    @license = SpdxLicenses::License.new('Apache-2.0', 'Apache License 2.0', true)
  end

  def test_id
    assert_equal 'Apache-2.0', @license.id
  end

  def test_name
    assert_equal 'Apache License 2.0', @license.name
  end

  def test_osi_approved
    assert_equal true, @license.osi_approved
  end

  def test_osi_approved?
    assert_equal true, @license.osi_approved?
  end
end
