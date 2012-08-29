require 'tempfile'
require "open-uri"

task :default => [:databag]
def file_write
  url = "http://log.my.com:8080/site/index.json"
  json_file = open(url).read
  file = Tempfile.new("node.json","w")
  file.write(json_file)
  file.rewind
  system("knife data bag from file logs #{file.path}")
  file.close
end

desc "add data bag logs from nodes json"
task :databag do
  file_write
end