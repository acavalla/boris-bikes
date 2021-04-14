# Santander Cycle Project #

A progressive challenge to model how a developer would build a program for the TfL bike rental and docking system, along with all the necessary infrastructure.

## Tech and tools ##

- Ruby
- TDD
- Mixins

## How to run

1. Clone this repo: `git clone https://github.com/acavalla/boris-bikes.git`
2. Open the Ruby REPL `irb -r runfile.rb`

```
2.7.2 :001 > van = Van.new

 => #<Van:0x00007fc75d8b6678 @capacity=20, @bikes=[]>
2.7.2 :002 > ds = DockingStation.new
 => #<DockingStation:0x00007fc759afc7b0 @capacity=20, @bikes=[]>
2.7.2 :003 > garage = Garage.new
 => #<Garage:0x00007fc759a7d960 @capacity=20, @bikes=[]>
2.7.2 :004 > bike, bike2, bike3 = Bike.new, Bike.new, Bike.new
 => [#<Bike:0x00007fc759a5e650 @working=true>, #<Bike:0x00007fc759a5e628 @working=true>, #<Bike:0x00007fc759a5e600 @working=...
2.7.2 :005 > bike.broken
 => true
2.7.2 :006 > bike3.broken
 => true
2.7.2 :007 > ds.dock(bike)
 => [#<Bike:0x00007fc759a5e650 @working=false>]
2.7.2 :008 > ds.dock(bike2)
 => [#<Bike:0x00007fc759a5e650 @working=false>, #<Bike:0x00007fc759a5e628 @working=true>]
2.7.2 :009 > ds.dock(bike3)
 => [#<Bike:0x00007fc759a5e650 @working=false>, #<Bike:0x00007fc759a5e628 @working=true>, #<Bike:0x00007fc759a5e600 @working=false
>]
2.7.2 :010 > van.pickup(ds)
 => [#<Bike:0x00007fc759a5e600 @working=false>, #<Bike:0x00007fc759a5e650 @working=false>]
2.7.2 :011 > garage.receive_shipment(van)
 => [#<Bike:0x00007fc759a5e650 @working=false>, #<Bike:0x00007fc759a5e600 @working=false>]
2.7.2 :012 > garage.fix_bikes
 => [#<Bike:0x00007fc759a5e650 @working=true>, #<Bike:0x00007fc759a5e600 @working=true>]
2.7.2 :013 > van.pickup(garage)
 => [#<Bike:0x00007fc759a5e600 @working=true>, #<Bike:0x00007fc759a5e650 @working=true>]
2.7.2 :014 > ds.receive_shipment(van)
 => [#<Bike:0x00007fc759a5e650 @working=true>, #<Bike:0x00007fc759a5e600 @working=true>]
2.7.2 :015 > ds
 => #<DockingStation:0x00007fc759afc7b0 @capacity=20, @bikes=[#<Bike:0x00007fc759a5e628 @working=true>, #<Bike:0x00007fc759a5e650
@working=true>, #<Bike:0x00007fc759a5e600 @working=true>]>
```
