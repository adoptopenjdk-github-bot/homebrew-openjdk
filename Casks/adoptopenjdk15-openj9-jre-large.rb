# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk15-openj9-jre-large" do
  version "15.0.2,7"
  sha256 "533cc7c7f68f6dabc80f76ee2c9c53a52c0a39bc9f6be61c8da14da3ebf0518b"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk15-binaries/releases/download/jdk-15.0.2%2B7_openj9-0.24.0/OpenJDK15U-jre_x64_mac_openj9_macosXL_15.0.2_7_openj9-0.24.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jre_x64_mac_openj9_macosXL_15.0.2_7_openj9-0.24.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jre"
end
