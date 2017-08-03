iOS anti design pattern, puppet
=======================

#####Some applying scenarios : 
  + Don't want to alternate the current implementation
  + Don't want to change developers behavior by providing them new method, new api to do some more extra business
  + Want to upgrade existing bussiness implementation with minimum of code changes.

###Pros : 
  + The previous source code of super class is no longer required
  + Keep original base class interface, minimizing code changes in existing consumer.
  + Ability to upgrade business logic in conjunction with reusing existing implementation
  + Reduce visible additional subclass in case declare it as private

###Cons : 
  + Violate traditional inheritance model
  + Maybe get difficult / impossible to implement against programming language limitation
  + Must alternate class / object formal logic flow in run time.
  + Should deploy anti-pattern on the static creational method ONLY!


------------------------------

###Puppet pattern idea in action

[logo]: https://raw.githubusercontent.com/haikieu/iOS-anti-pattern-puppet/master/iOS-anti-pattern-puppet.jpg
![alt iOS anti design pattern puppet](https://raw.githubusercontent.com/haikieu/iOS-anti-pattern-puppet/master/iOS-anti-pattern-puppet.jpg "iOS anti design pattern puppet")




------------------------------

The MIT License (MIT)

#####Copyright (c) 2014 haikieu2907@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
