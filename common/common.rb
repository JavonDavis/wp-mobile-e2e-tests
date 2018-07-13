module Helpers
  class << self
    def kill_pid(pid)
      if ENV['platform'] == 'ios'
        Process.kill('INT', pid.to_i)
      else
        `kill #{pid} >> /dev/null 2>&1`
      end
    end

    def recording_setup(udid)
      `adb -s #{udid} shell 'mkdir /sdcard/recordings' >> /dev/null 2>&1`
      spawn "adb -s #{udid} shell rm /sdcard/recordings/*  >> /dev/null 2>&1"
    end

    def start_video_record(udid)
      time = Time.now.to_i
      if ENV['UDID'].include? 'emulator'
        puts "\nNot video recording. Cannot video record on #{udid} emulator!\n\n"
        nil
      else
        platform = ENV['platform']
        if platform == 'ios'
          puts "\nRecording! iOS Simulator for #{ENV['name']}...\n"
          command =  "xcrun simctl io #{udid} recordVideo #{ENV["BASE_DIR"]}/output/video-#{udid}-#{time}.mov"
          puts "Executing #{command}"
          pid = spawn command
          ENV['VIDEO_PID'] = pid.to_s
        elsif platform == 'android'
          recording_setup udid
          puts "\nRecording! You have a maximum of 180 seconds record time...\n"
          pid = spawn "adb -s #{udid} shell screenrecord --size 720x1280 /sdcard/recordings/video-#{udid}-#{time}.mov"
          ENV['VIDEO_PID'] = pid.to_s
        end
      end
    end

    def take_screenshot(driver)
      time = Time.now.to_i
      driver.screenshot "#{ENV['BASE_DIR']}/output/screenshot-#{ENV['UDID']}-#{time}.png"
    end

    def stop_video_record(udid)
      return if ENV['UDID'].include? 'emulator'
      kill_pid ENV['VIDEO_PID']
      sleep 5 # delay for video to complete processing on device...
      if ENV['platform'] == 'android'
        spawn "adb -s #{udid} pull /sdcard/recordings/video-#{udid}.mov ./output"
      end
    end

    def start_logcat(udid)
      time = Time.now.to_i
      pid = spawn("adb -s #{udid} logcat -v long", out: "./output/logcat-#{udid}-#{time}.log")
      ENV['LOGCAT_PID'] = pid.to_s
    end

    def stop_logcat
      kill_pid ENV['LOGCAT_PID']
    end

    def clean_output_folder
      system "rm ./output/*#{ENV['UDID']}*"
    end
  end
end

module Kernel
  def helper
    Helpers
  end
end