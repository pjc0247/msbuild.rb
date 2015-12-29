require 'os'
require 'pathname'
require 'win32/registry'

class OS
  def self.is_64bits?
    if OS.windows?
      return ENV.has_key?('ProgramFiles(x86)')
    else
      return OS.bits == 64
    end
  end
end

class MSBuild
  def self.avaliable_versions
    results = []

    begin
      Win32::Registry::HKEY_LOCAL_MACHINE.open(registry_path) do |reg|
        reg.each_key do |version|
          Win32::Registry::HKEY_LOCAL_MACHINE.open(registry_path + version) do |item|
            results.push MSBuild.new(
              item["MSBuildRuntimeVersion"],
              item["MSBuildToolsPath"])  
          end    
        end
      end 
    rescue
    end

    return results.uniq { |x| x.version }
  end

  def self.registry_path
    if OS.is_64bits?
      "Software\\Wow6432Node\\Microsoft\\MSBuild\\ToolsVersions\\"
    else
      "Software\\Microsoft\\MSBuild\\ToolsVersions\\"
    end
  end

  def build args=nil
    `"#{@path}\\msbuild" #{args}`
  end
end
