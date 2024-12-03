# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.node_20
    pkgs.corepack
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "angular.ng-template"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        npm-install = "pnpm install --frozen-lockfile --prefer-offline";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ "nx.json" ];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        # web = {
        #   command = ["npm" "run" "start" "--" "--port" "$PORT" "--host" "0.0.0.0" "--disable-host-check"];
        #   manager = "web";
        # };
      };
    };
  };
}