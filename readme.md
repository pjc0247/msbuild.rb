msbuild.rb
====

MSBuild wrapper for ruby

Installation
----
```
gem install msbuild
```

Example
----
```rb
require 'msbuild'

list = MSBuild.avaliable_versions

puts "Avaliable versions"
list.each do |msbuild|
  puts msbuild.version
  puts msbuild.path
end

puts list.first.build "Path/Project.csproj"
```

Supported Platforms
----
* __Windows__
  * Visual Studio
* __OSX__
  * Mono
  * Mono (Unity3d)