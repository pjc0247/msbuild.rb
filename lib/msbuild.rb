require 'os'

class MSBuild
  def self.avaliable_versions
    # override me
    raise RuntimeError.new("Unsupported Platform")
  end

  attr_reader :path
  attr_reader :version

  def initialize version, path
    @version = version
    @path = path
  end

  def build args=nil
    # override me
  end
end

if OS.windows?
  require_relative 'msbuild_windows'
elsif OS.osx?
  require_relative 'msbuild_osx'
else
  # current platform is not supported
end