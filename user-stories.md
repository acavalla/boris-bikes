# Day 1

## Why is a README important? ##
A README is the front page of a project. It explains what the code does and why. This helps your software proliferate as developers can understand how to use it and where they might need to.

## User stories / domain models ##
Challenge 2
| Objects         | Messages     |
| --------------- | -----------  |
| Person          |              |
| Bike            | is_working?  |
| Docking station | release_bike |
|                 | bike_present |
|                 | dock         |

![](image.png)

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```
## Errors (are good) ##
Challenge 3, 4

```ruby
2.6.5 :002 > docking_station = DockingStation.new

Traceback (most recent call last):
        5: from /Users/annie/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'
        4: from /Users/annie/.rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'
        3: from /Users/annie/.rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/i
rb:11:in `<top (required)>'
        2: from (irb):2
        1: from (irb):2:in 'rescue in irb_binding'
NameError (uninitialized constant DockingStation)
```

The NameError means that the object we are asking irb to create (a DockingStation class object) is undefined. It tells you which line the error occurred on, and that it looked in the folder where ruby was installed and didn't find a native method DockingStation.

To solve the error, we created a class called DockingStation.
```ruby
class DockingStation
end

docking_station = DockingStation.new
```

## RSpec & TDD ##
