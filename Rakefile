require 'json'
require 'net/https'
require 'rake/testtask'

task :download do
  LICENSES_URI = URI.parse('https://spdx.org/licenses/licenses.json')

  http = Net::HTTP.new(LICENSES_URI.host, LICENSES_URI.port)
  if LICENSES_URI.scheme == 'https'
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  response = http.request_get(LICENSES_URI.path)
  raise "Downloading the licenses file failed: #{response.message}." unless response.is_a?(Net::HTTPOK)

  string = response.body.force_encoding('UTF-8')
  File.open('licenses.json', 'w') do |file|
    file.puts(JSON.pretty_generate(JSON.parse(string)))
  end
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*test.rb']
  t.verbose = true
end

task :default => [:test]
