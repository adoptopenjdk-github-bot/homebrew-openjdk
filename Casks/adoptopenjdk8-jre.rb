# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-jre" do
  version "8,292:b10"
  sha256 "42a3a7992d46b6d1cf78e56eec11152411d194bbaff7035acde6d00eeb2cec68"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk8u292-b10/OpenJDK8U-jre_x64_mac_hotspot_8u292b10.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8 (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jre_x64_mac_hotspot_8u292b10.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8.jre"
end
