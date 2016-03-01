extendedsvg = $(wildcard *.esvg)
partialsvg = $(patsubst %.esvg, %.psvg, $(extendedsvg))
secsvg = $(patsubst %.esvg, %.svg, $(extendedsvg))
mainsvg = $(patsubst %.fsvg, %.svg, $(wildcard *.fsvg))

default : $(mainsvg) $(secsvg)

%.svg : %.esvg
	m4 -U EXTRACT $*.esvg > $*.svg

%.psvg : %.esvg
	m4 -D EXTRACT $*.esvg > $*.psvg

%.svg : %.fsvg $(partialsvg)
	m4 $*.fsvg > $*.svg

menage :
	rm -f $(mainsvg) $(secsvg) $(partialsvg)
