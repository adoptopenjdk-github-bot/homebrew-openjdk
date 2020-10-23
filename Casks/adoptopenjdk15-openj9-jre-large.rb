# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk15-openj9-jre-large" do
  version "15,36"
  sha256 "4ba9adc3c8847e69428ec555eec82b934da08283fbe893a74448c3fcbe37df8a"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk15-binaries/releases/download/jdk-15%2B36_openj9-0.22.0/OpenJDK15U-jre_x64_mac_openj9_macosXL_15_36_openj9-0.22.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jre_x64_mac_openj9_macosXL_15_36_openj9-0.22.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jre"
end