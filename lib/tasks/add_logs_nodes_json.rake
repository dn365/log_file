require "open-uri"

task :default => [:databag]
def file_write
  url = "http://log.my.com:8080/site/index.json"
  json_file = open(url).read
  file = File.open("/tmp/nodes.json","w")
  file.puts(json_file)
  file.close
end

desc "add data bag logs from nodes json"
task :databag do
  file_write
  system("knife data bag from file logs /tmp/nodes.json")
end