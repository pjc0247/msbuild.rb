require 'os'
require 'pathname'

class MSBuild
  def self.avaliable_versions
    results = []

    mono_xbuild_path = "/usr/local/bin/xbuild"
    if File.exists? mono_xbuild_path
      results.push MSBuild.new("mono", mono_xbuild_path)
    end
    unity_xbuild_path = "/Applications/Unity/Unity.app/Contents/Frameworks/Mono/bin/xbuild"
    if File.exists? unity_xbuild_path
      results.push MSBuild.new("unity_mono", unity_xbuild_path)
    end

    return results
  end

  def build args=nil
    `#{@path}/xbuild #{args}`
  end
end
