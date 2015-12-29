require_relative 'msbuild'

list = MSBuild.avaliable_versions

puts "Avaliable versions"
list.each do |msbuild|
  puts msbuild.version
  puts msbuild.path
end

puts list.first.build ""