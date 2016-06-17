#!/usr/bin/env ruby

require 'pandoc-filter'

PandocFilter.filter do |type, value, format, meta|
  if type == 'Emph'
    PandocElement.Strong(value)
  end
end
