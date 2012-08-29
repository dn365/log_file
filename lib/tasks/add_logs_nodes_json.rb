#!/usr/bin/env ruby

require "open-uri"

def file_write
  url = "http://log.my.com:8080/site/index.json"
  json_file = open(url).read
  file = File.open("/tmp/nodes.json","w")
  file.puts(json_file)
  file.close
end

file_write
%x[knife data bag from file logs /tmp/nodes.json]
