# encoding: utf-8

#
# Inlämningsuppgift 2a i Programmering för Testare vt2013
#

puts "Välkommen till gissningsspelet. Kan du gissa talet?"

# läs in en övre gräns för talet att gissa
print ("Skriv in övre gräns för talet: ")
limit = gets.chomp.to_i

puts limit #debug