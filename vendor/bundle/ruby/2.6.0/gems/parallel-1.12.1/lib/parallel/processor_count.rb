if RUBY_VERSION.to_f >= 2.2
  require 'etc'
end

module Parallel
  module ProcessorCount
    # Number of processors seen by the OS and used for process scheduling.
    #
    # * AIX: /usr/sbin/pmcycles (AIX 5+), /usr/sbin/lsdev
    # * BSD: /sbin/sysctl
    # * Cygwin: /proc/cpuinfo
    # * Darwin: /usr/bin/hwprefs, /usr/sbin/sysctl
    # * HP-UX: /usr/sbin/ioscan
    # * IRIX: /usr/sbin/sysconf
    # * Linux: /proc/cpuinfo
    # * Minix 3+: /proc/cpuinfo
    # * Solaris: /usr/sbin/psrinfo
    # * Tru64 UNIX: /usr/sbin/psrinfo
    # * UnixWare: /usr/sbin/psrinfo
    #
    def processor_count
      @processor_count ||= begin
        if defined?(Etc) && Etc.respond_to?(:nprocessors)
          Etc.nprocessors
        else
          os_name = RbConfig::CONFIG["target_os"]
          if os_name =~ /mingw|mswin/
            require 'win32ole'
            result = WIN32OLE.connect("winmgmts://").ExecQuery(
              "select NumberOfLogicalProcessors from Win32_Processor")
            result.to_enum.collect(&:NumberOfLogicalProcessors).reduce(:+)
          elsif File.readable?("/proc/cpuinfo")
            IO.read("/proc/cpuinfo").scan(/^processor/).size
          elsif File.executable?("/usr/bin/hwprefs")
            IO.popen("/usr/bin/hwprefs thread_count").read.to_i
          elsif File.executable?("/usr/sbin/psrinfo")
            IO.popen("/usr/sbin/psrinfo").read.scan(/^.*on-*line/).size
          elsif File.executable?("/usr/sbin/ioscan")
            IO.popen("/usr/sbin/ioscan -kC processor") do |out|
              out.read.scan(/^.*processor/).size
            end
          elsif File.executable?("/usr/sbin/pmcycles")
            IO.popen("/usr/sbin/pmcycles -m").read.count("\n")
          elsif File.executable?("/usr/sbin/lsdev")
            IO.popen("/usr/sbin/lsdev -Cc processor -S 1").read.count("\n")
          elsif File.executable?("/usr/sbin/sysconf") and os_name =~ /irix/i
            IO.popen("/usr/sbin/sysconf NPROC_ONLN").read.to_i
          elsif File.executable?("/usr/sbin/sysctl")
            IO.popen("/usr/sbin/sysctl -n hw.ncpu").read.to_i
          elsif File.executable?("/sbin/sysctl")
            IO.popen("/sbin/sysctl -n hw.ncpu").read.to_i
          else
            $stderr.puts "Unknown platform: " + RbConfig::CONFIG["target_os"]
            $stderr.puts "Assuming 1 processor."
            1
          end
        end
      end
    end

    # Number of physical processor cores on the current system.
    #
    def physical_processor_count
      @physical_processor_count ||= begin
        ppc = case RbConfig::CONFIG["target_os"]
        when /darwin1/
          IO.popen("/usr/sbin/sysctl -n hw.physicalcpu").read.to_i
        when /linux/
          cores = {}  # unique physical ID / core ID combinations
          phy = 0
          IO.read("/proc/cpuinfo").scan(/^physical id.*|^core id.*/) do |ln|
            if ln.start_with?("physical")
              phy = ln[/\d+/]
            elsif ln.start_with?("core")
              cid = phy + ":" + ln[/\d+/]
              cores[cid] = true if not cores[cid]
            end
          end
          cores.count
        when /mswin|mingw/
          require 'win32ole'
          result_set = WIN32OLE.connect("winmgmts://").ExecQuery(
            "select NumberOfCores from Win32_Processor")
          result_set.to_enum.collect(&:NumberOfCores).reduce(:+)
        else
          processor_count
        end
        # fall back to logical count if physical info is invalid
        ppc > 0 ? ppc : processor_count
      end
    end
  end
end
