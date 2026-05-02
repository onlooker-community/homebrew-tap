# Formula/onlooker.rb
class Onlooker < Formula
  desc "Local observability agent for Claude Code"
  homepage "https://onlooker.dev"
  license "BlueOak-1.0.0"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_darwin_arm64.tar.gz"
      sha256 "c4c5d50514380963d8649ac01860d0751c9a0a9ab0b2ccfcec59ef10ec3f4097"
    end
    on_intel do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_darwin_amd64.tar.gz"
      sha256 "4f5552c47c0319da0f382ca0f6502a83ca603de85f0d199ad3481e7e41acddfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_linux_arm64.tar.gz"
      sha256 "cff3ec57a6a3c9dca4710117d0239bba0777aee2bb87ae2a4bf399d5aaf1ba0d"
    end
    on_intel do
      url "https://github.com/onlooker-community/onlooker/releases/download/v#{version}/onlooker_linux_amd64.tar.gz"
      sha256 "ab5937b3fc0b9c256a60db7f120af45799dd32a600228d3146fb62a0114cd625"
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

      Then start the background agent (or let Homebrew manage it):

        onlooker daemon
        brew services start onlooker

      Config: ~/.config/onlooker/config.toml
      Docs:   https://onlooker.dev/docs
    EOS
  end

  test do
    system "#{bin}/onlooker", "version"
  end
end
