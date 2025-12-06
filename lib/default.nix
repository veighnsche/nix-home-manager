# TEAM_424: Helper utilities for home-manager modules
{ lib, ... }:

{
  # Merge multiple package lists, flattening and deduplicating
  mergePackages = lists: lib.unique (lib.flatten lists);

  # Create a feature module with standard structure
  mkFeature = { name, packages ? [], config ? {} }: {
    home.packages = packages;
  } // config;

  # Helper to conditionally include a module
  mkOptionalModule = condition: module:
    lib.mkIf condition module;

  # Standard program module template
  mkProgramModule = { enable ? true, extraConfig ? {} }: {
    inherit enable;
  } // extraConfig;
}
