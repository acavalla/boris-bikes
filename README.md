![language-ruby](https://img.shields.io/badge/language-ruby-red) ![version-2.6.5](https://img.shields.io/badge/version-2.7.2-lightgrey) ![coverage-score](https://img.shields.io/badge/coverage-100%25-success)

# Santander Cycle Project #

A progressive challenge to model how a developer would build a program for the TfL bike rental and docking system, along with all the necessary infrastructure.

###Concepts
- TDD cycle (RGR)
- Mixins
- Domain modelling
- Encapsulation and cohesion
- Single responsibility principle
- Private methods
- Isolated unit tests using stubs and mocks

## How to run

1. Clone this repo: `git clone https://github.com/acavalla/boris-bikes.git`
2. To run the test suite, run `rspec`
2. Open the Ruby REPL `irb -r runfile.rb`. Please see below for demo of functionality.

In this example, an instance of each class is instantiated, as well as three bikes. Two of the bikes are broken. The van picks up only the broken bikes, and drops them off at the garage. The garage fixes them, and sends them back to the station in the van.
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
 => [#<Bike:0x00007fc759a5e650 @working=false>, #<Bike:0x00007fc759a5e628 @working=true>, #<Bike:0x00007fc759a5e600 @working=false>]
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
 => #<DockingStation:0x00007fc759afc7b0 @capacity=20, @bikes=[#<Bike:0x00007fc759a5e628 @working=true>, #<Bike:0x00007fc759a5e650 @working=true>, #<Bike:0x00007fc759a5e600 @working=true>]>
```
