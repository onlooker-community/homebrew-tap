# Formula/onlooker.rb
class Onlooker < Formula
  desc "Local observability agent for Claude Code"
  homepage "https://onlooker.dev"
  license "BlueOak-1.0.0"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_Darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_ARM64"
    end
    on_intel do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_Darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_Linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_Linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64"
    end
  end

  def install
    bin.install "onlooker"
  end

  service do
    run [opt_bin/"onlooker", "daemon"]
    keep_alive true
    log_path var/"log/onlooker.log"
    error_log_path var/"log/onlooker.log"
    environment_variables PATH: std_service_path_env
  end

  def caveats
    <<~EOS
      To get started, link this machine to your Onlooker account:

        onlooker link

      Then start the background agent:

        onlooker daemon

      Or let Homebrew manage it as a service:

        brew services start onlooker

      Onlooker watches ~/.claude/onlooker/ for plugin telemetry and syncs
      it to your account at app.onlooker.dev.

      Config is stored at:
        ~/.config/onlooker/config.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onlooker version")
  end
end
