# encoding: utf-8

#
# Inlämningsuppgift 1c i Programmering för Testare vt2013
#

# skriv ut "tabellhuvudet", 20 tecken+1+15 tecken
puts "Namn".ljust(20) + " " + "Datum".rjust(15)
divider = "-"*20 + "|" + "-"*15 # återanvänds i tabellfoten
puts divider


# läs in namn & datum till två arrayer
names = File.open("namn.txt").readlines
dates = File.open("datum.txt").readlines

# datumen är på formatet YY-MM-DD, men vi vill har fyra siffror för årtal
# datumen är strängar, och vi kan indexera strängar precis som en array
# vi vet att om de två första tecknen YY är mellan 0 & 13 är det 2000-talet
# vi går igenom dates-arrayen & jämför om strängens två första tecken är <13
# beroende på lägger vi sen till "20" eller "19" längst fram i strängen 
fulldates = dates.map do |date|
	if( date[0..1].to_i ) < 13 then
		"20" + date 
	else
		"19" + date
	end
end


# rad 1 i namn.txt motsvarar rad 1 i datum.txt
# så plats 1 i names motsvarar plats 1 dates
# vi går igenom names "rad för rad" med en while-loop
# för varje rad skriver vi ut namn & motsvarade datum
row = 0;
while( row < names.length )
	#print nice looking name & date information
	print names[row].chomp.ljust(20)
	print "|"
	puts fulldates[row].chomp.rjust(15) # puts to get a new line

	#advance to next "row" in arrays
	row += 1;
end


# skriv ut "tabellfoten", totalt antal namn är = name-arrayens längd
puts divider
puts "Totalt antal".ljust(20) + " " + names.length.to_s.rjust(15)
