require 'json'
require 'spdx-licenses/license'
require 'spdx-licenses/version'

module SpdxLicenses
  def self.data
    unless defined?(@@data)
      spdx = JSON.load(File.read(File.expand_path('../../licenses.json', __FILE__)))

      # Convert the array of hashes to a hash with the license ID as the key and
      # the rest of each hash as the value.
      @@data = {}
      spdx['licenses'].each do |details|
        id = details.delete('licenseId')
        @@data[id] = details
      end
    end

    @@data
  end

  def self.lookup(id)
    entry = data[id.to_s]
    SpdxLicenses::License.new(id.to_s, entry['name'], entry['isOsiApproved']) if entry
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
