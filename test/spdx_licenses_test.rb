$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'
require 'mocha/minitest'
require 'spdx-licenses'

class TestSpdxLicenses < Minitest::Test
  def test_exist_unknown
    assert_equal false, SpdxLicenses.exist?('unknown')
  end

  def test_exist_known
    assert_equal true, SpdxLicenses.exist?('Apache-2.0')
  end

  def test_lookup_unknown
    assert_nil SpdxLicenses.lookup('unknown')
  end

  def test_lookup_known
    SpdxLicenses::License.expects(:new).with('Apache-2.0', 'Apache License 2.0', true).returns('license')
    assert_equal 'license', SpdxLicenses.lookup('Apache-2.0')
  end

  def test_version
    assert_equal SpdxLicenses::VERSION, SpdxLicenses.version
  end
end
