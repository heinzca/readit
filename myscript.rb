class Car
   WHEELS=4             # class constant
   @@number_of_cars=0   # class variable
   def initialize
     @@number_of_cars=@@number_of_cars+1
   end
   def self.count
     @@number_of_cars
   end
   def mileage=(x)      # instance variable writer
     @mileage=x
   end
   def mileage          # instance variable reader
     @mileage
   end
end

 class StretchLimo < Car
   WHEELS=6           # class constant
   @@televisions=1   # class variable
   def turn_on_television
     # invoke code for tv
   end
 end

 class PontiacFirebird < Car
 end

 class VolksWagen < Car
 end

 puts "No cars have been produced yet" if Car.count.zero?
 kitt=PontiacFirebird.new
 kitt.mileage=5667

 herbie=VolksWagen.new
 herbie.mileage=33014

 batmobile=PontiacFirebird.new
 batmobile.mileage=4623

 larry=StretchLimo.new
 larry.mileage=20140

 unless kitt.is_a?(StretchLimo)
   puts "This car is only licensed to seat two people"
 end

puts "Service due!" unless kitt.mileage<25000

# while Car.count < 10
#   Car.new
#   puts "A new car instance has been created"
#   puts Car.count
# end

# [ kitt, herbie, batmobile, larry ].each do |car_name|
#   puts car_name.mileage
# end

car_colours = {
  kitt: 'black',
  herbie: 'white',
  batmobile: 'black',
  larry: 'green'
}

car_colours.each do |car_name, colour|
  puts"#{car_name} is #{colour}"
end

10.times {Car.new}
puts "#{Car.count} cars have been produced"

5.upto(7) {|i| puts i}
