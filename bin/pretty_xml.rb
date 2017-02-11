#!/usr/bin/env/ruby

require 'nokogiri'

doc = Nokogiri::XML(ARGF)
puts doc.to_s

