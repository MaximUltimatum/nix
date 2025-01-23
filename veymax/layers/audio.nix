{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.sox # use for the `play` command to play files
    pkgs.yt-dlp
    pkgs.audacity
    pkgs.ffmpeg
    pkgs.spotify
  ];
}
