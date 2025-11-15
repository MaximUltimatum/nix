{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    jrnl
  ];

  home.file.".config/jrnl/jrnl.yaml" = {
    text = ''
      colors:
        body: none
        date: black
        tags: yellow
        title: cyan
      default_hour: 9
      default_minute: 0
      editor: nvim
      encrypt: false
      highlight: true
      indent_character: '|'
      journals:
        default:
          journal: $HOME/.local/share/jrnl/journal.txt
        health:
          journal: $HOME/.local/share/jrnl/health.txt
          template: $HOME/.local/share/jrnl/health_template.txt
        goals:
          journal: $HOME/.local/share/jrnl/goals.txt
          template: $HOME/.local/share/jrnl/goals_template.txt
        private:
          journal: $HOME/.local/share/jrnl/private.txt
          encrypt: true
      linewrap: 79
      tagsymbols: '#@'
      template: false
      timeformat: '%F %r'
      version: v4.2
    '';
  };
  home.file.".local/share/jrnl/health_template.txt" = {
    text = ''
      _ foodgroups (fruits/veggies/proteins/grains/dairy)
      _ exercise (weights(time)/walking(distance)/HIT(time))
    '';
  };
  home.file.".local/share/jrnl/goals_template.txt" = {
    text = ''
      Goals this week:
      _ ulrika 0-7 walks
      _ food 0-3 prepped or cooked meals
      _ house 0-7 cleaning tasks
      _ organize 0-3 organized rooms
      _ emma 0-1 date night
      _ social 0-1 hangouts
      _ hobby 0-1 hobby
    '';
  };
}
