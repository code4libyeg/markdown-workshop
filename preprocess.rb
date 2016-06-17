#!/usr/bin/env ruby

@mainyamldone = false
@inyaml = false
@inbox = false

ARGF.each_with_index do |line, idx|
	if /<p class=\"right\".*/.match(line)
		print "\\rightline{\\texttt{" + /\>(.*)\</.match(line)[1] + "}}\n"
	elsif /^\<div class=\"box\"/.match(line)
		@inbox = true
		print "\\fboxsep=10pt\n\\fbox{\\begin{minipage}{30em}\n"
	elsif /^\<\/div\>/.match(line)
		@inbox = false
	    print "\\end{minipage}}\n"
	elsif /^---$/.match(line)
		print line if !@mainyamldone
		@inyaml = !@inyaml
		@mainyamldone = true if !@inyaml
	elsif @inbox
		# handle text lines in catalogue card box
		print "\\texttt{" + line.gsub(/\*(.+?)\*/,"\\underline{\\1}").sub(/^(\ )*/,"\\hspace*{0.5ex}") + "\\\\}\n"

	else
		print line unless (@inyaml && @mainyamldone)
	end
end
