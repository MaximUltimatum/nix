{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    sox # use for the `play` command to play files
    yt-dlp
    audacity
    ffmpeg
    spotify
  ];
}
