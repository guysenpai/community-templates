{ pkgs, preset ? "apps", ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.corepack
  ];
  bootstrap = ''
    pnpm dlx create-nx-workspace "$WS_NAME" --preset "${preset}" --pm "pnpm" --commit.message "chore: :tada: add initial commit" --ci "skip" --skip-git --skip-install
    mkdir "$WS_NAME"/.idx
    cp ${./dev.nix} "$WS_NAME"/.idx/dev.nix
    chmod -R +w "$WS_NAME"/.idx/dev.nix
    mv "$WS_NAME" "$out"
    (cd "$out"; pnpm install --lockfile-only --ignore-scripts)
  '';
}