# encoding: utf-8

#
# Inlämningsuppgift 2b i Programmering för Testare vt2013
#

puts "Välkommen till Björnjakten!"

# björnen är 50 till 100 meter bort
answer = Random.rand(50..100)

puts "Något rusar fram mellan träden ca 50 till 100 meter bort."

# läs in gissning, gå ur loopen omm gissning == svaret
while( true )
	print ("Du ser en arg björn! Hur långt bort siktar du?: ")
	guess = gets.chomp.to_i

	if( guess == answer )
		puts "Du träffar björnen, puh!"
		break
	end

	puts "Du sköt för #{ (guess<answer)? 'kort': 'långt' }!"

	# räkna ut hur nära björnen är
	rush = Random.rand(10..20)
	answer = answer - rush
	unless answer > 0 
		puts "Björnen kommer ifatt dig. Åh nej..."
		exit
	else
		puts "Björnen rusar #{rush} meter närmare dig!"
	end
end
