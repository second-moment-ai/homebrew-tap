# typed: false
# frozen_string_literal: true

# Homebrew is no longer a supported install path for shmem.
#
# This formula was last regenerated on 2026-07-07 and pinned v0.2.25. Nothing
# updated it after that: .goreleaser.yaml has no `brews:` block, so releases
# publish artifacts to this repo without touching the formula. It kept
# installing cleanly the whole time — a four-month-old binary, with no error
# and no hint that anything was wrong.
#
# That is worse than a broken formula. A failure sends someone to the docs; a
# silent success sends them away believing they have tried shmem.
#
# `disable!` makes `brew install` stop with the message below instead of
# installing a stale build. The RELEASES in this repo are untouched and must
# stay: install.sh and `shmem upgrade` read them, and every installed binary
# has that endpoint compiled in.
class Shmem < Formula
  desc "External memory system for LLMs with multi-index retrieval"
  homepage "https://shmem.secondmoment.ai/docs/"
  url "https://shmem.secondmoment.ai/docs/install.sh"
  version "0.2.25"
  sha256 :no_check

  disable! date: "2026-10-05", because: <<~REASON.gsub("\n", " ").strip
    Homebrew is not a supported install path for shmem and this formula was
    frozen at v0.2.25. Install with:
    curl -fsSL https://shmem.secondmoment.ai/docs/install.sh | sh
    Already installed via brew? Run `shmem upgrade`, then `brew uninstall shmem`.
  REASON

  def install
    odie <<~MSG
      Homebrew is not a supported install path for shmem.

      This formula was frozen at v0.2.25 (2026-07-07) and would install a
      binary months out of date.

        curl -fsSL https://shmem.secondmoment.ai/docs/install.sh | sh

      If you installed via brew previously:

        shmem upgrade          # replaces the brew-managed binary in place
        brew uninstall shmem   # let brew stop tracking it

      On v0.2.25 or earlier `shmem upgrade` refuses to touch a brew-managed
      binary, so uninstall first and reinstall with the script above.

      Docs: https://shmem.secondmoment.ai/docs/
    MSG
  end
end
