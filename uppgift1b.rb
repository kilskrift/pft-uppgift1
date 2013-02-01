# encoding: utf-8

#
# Inlämningsuppgift 1b i Programmering för Testare vt2013
#

# skriv ut "tabellhuvudet", 20 tecken+1+15 tecken
puts "Namn".ljust(20) + " " + "Datum".rjust(15)
divider = "-"*20 + "|" + "-"*15 # återanvänds i tabellfoten
puts divider


# läs in namn & datum till två arrayer
names = File.open("namn.txt").readlines
dates = File.open("datum.txt").readlines

# rad 1 i namn.txt motsvarar rad 1 i datum.txt
# så plats 1 i names motsvarar plats 1 dates
# vi går igenom names "rad för rad" med en while-loop
# för varje rad skriver vi ut namn & motsvarade datum
row = 0;
while( row < names.length )
	puts names[row].chomp + " " + dates[row].chomp
	row += 1;
end


# skriv ut "tabellfoten", totalt antal namn är = name-arrayens längd
puts divider
puts "Totalt antal".ljust(20) + " " + names.length.to_s.rjust(15)
