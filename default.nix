{}:

(import ./reflex-platform {}).project ({ pkgs, ... }: {
  packages = {
    common = ./common;
    backend = ./backend;
    frontend = ./frontend;
  };

  # android.frontend = {
  #   executableName = "frontend";
  #   applicationId = "org.example.frontend";
  #   displayName = "Example Android App";
  # };

  # ios.frontend = {
  #   executableName = "frontend";
  #   bundleIdentifier = "org.example.frontend";
  #   bundleName = "Example iOS App";
  # };

  shells = {
    ghc = ["common" "backend" "frontend"];
    ghcjs = ["common" "frontend"];
  };

  overrides = self: super: {
    foundation = pkgs.haskell.lib.dontCheck super.foundation;
    # lens = self.callHackage "lens" "4.15.4" {};
    # free = self.callCabal2nix "free" (pkgs.fetchFromGitHub {
    #   owner = "ekmett";
    #   repo = "free";
    #   rev = "a0c5bef18b9609377f20ac6a153a20b7b94578c9";
    #   sha256 = "0vh3hj5rj98d448l647jc6b6q1km4nd4k01s9rajgkc2igigfp6s";
    # }) {};
  };
})
