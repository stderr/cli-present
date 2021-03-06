#!/usr/bin/env ruby

require 'io/console'

msg = ARGV.shift or fail "no message text given"

rows, cols = IO.console.winsize

msg_lines = msg.lines.count

vert_padding    = "\n" * ((rows - msg_lines) / 2)
extra_padding   = "\n" unless ((rows - msg_lines) % 2).zero?
extra_padding ||= ""

msg_line = lambda { |l|
  padding = " " * ((cols - l.chomp.size) / 2)
  padding << l.chomp
}

print vert_padding +
      msg.lines.map { |l| msg_line.(l) }.join("\n") +
      vert_padding +
      extra_padding

if IO.console.getch == "q"
  exit 1
end
