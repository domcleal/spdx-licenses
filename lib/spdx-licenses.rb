require 'json'
require 'spdx-licenses/license'
require 'spdx-licenses/version'

module SpdxLicenses
  def self.data
    @@data ||= JSON.load(File.read(File.expand_path('../../spdx.json', __FILE__)))
  end

  def self.lookup(id)
    entry = data[id.to_s]
    SpdxLicenses::License.new(id.to_s, entry['name'], entry['osiApproved']) if entry
  end

  def self.exist?(id)
    data.has_key? id.to_s
  end

  def self.version
    VERSION
  end

  class << self
    alias_method :[], :lookup
    alias_method :exists?, :exist?
  end
end
