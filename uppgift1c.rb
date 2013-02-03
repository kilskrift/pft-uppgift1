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
# .map skapar en ny array av returvärdet från det block den kör på arrayen
fulldates = dates.map do |date|
	if( date[0..1].to_i ) < 13 then
		"20" + date 
	else
		"19" + date
	end
end

# vi vill sortera resultaten efter datum, men eftersom vi har våra värden
# spridda över två arrayer kan vi förenkla för oss genom att lägga ihop dem
# i en hash namn => datum
name_and_date = {} #empty hash
for i in (0...names.length) # 0 to lenght-1
	name_and_date[ names[i] ] = fulldates[i] #add to hash w/name as key to date
end
# (alt. kan man skapa en "par"-array m/Array.zip & skapa hashen m/Hash[[k,v],..])


# en hash är till sin natur osorterad, men vi kan returnera en array med sort_by
# sort_by tar ett block som argument, där kan vi ange att vi vill sortera på datum
sorted_by_date = name_and_date.sort_by { |name, date| date }
sorted_by_date.each do |nd|
	print nd[0].chomp.ljust(20)
	print "|"
	puts nd[1].chomp.rjust(15) # puts to get a new line
end


# skriv ut "tabellfoten", totalt antal namn är = name-arrayens längd
puts divider
puts "Totalt antal".ljust(20) + " " + names.length.to_s.rjust(15)
