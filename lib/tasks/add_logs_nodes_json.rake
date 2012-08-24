require 'tempfile'
require "open-uri"

task :default => [:databag]
def file_write
  url = "http://mytest:3000/site/index.json"
  json_file = open(url).read
  file = File.open("/tmp/node.json","w")
  file.puts(json_file)
  file.close
end

desc "add data bag logs from nodes json"
task :databag do
  file_write
end