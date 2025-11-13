{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	      layer = "top";
	      spacing = 4;
	      exclusive = true;
	      margin-top = 8;
	      margin-left = 16;
	      margin-right = 16;
	      modules-left = [ "hyprland/workspaces"];
	      modules-center = [ "clock" ];
	      modules-right = [ "cpu" "custom/sep" "memory" "custom/sep" "network" "battery" "custom/sep" "group/powers" ];

        cpu = {
          interval = 1;
          format = "{}% ";
          max-length = 10;
        };
        memory = {
          interval = 30;
          format = "{}% ";
          max-length = 10;
        };

	      battery = {
	      	interval = 60;
	      	states = {
	      		warning = 20;
	      		critical = 10;
	      	};
	      	format = "{icon}";
	      	format-icons = ["" "" "" "" ""];
	      	format-time = "{H}h {M}min left";
	      	tooltip-format = "{capacity}% ({time})";
	      	tooltip-format-charging = "{capacity}% (charging)";
	      };

        network = {
        	format-wifi = "";
        	tooltip-format-wifi = "{essid} ({signalStrength}%)";
        	format-ethernet = "";
        	tooltip-format-ethernet = "";
        	format-disconnected = "";
        	tooltip-format-disconnected = "disconnected";
        };

        "group/powers" = {
          orientation = "inherit";
        	drawer = {
        	  transition-duration = 500;
        	  transition-left-to-right = false;
            children-class = "power-buttons";
          };
        	modules = [ "custom/logout" "custom/power" "custom/lock" "custom/reboot" ];
        };

    	  "custom/lock" = {
    	  	format = "";
    	  	tooltip = false;
    	  	on-click = "hyprlock";
    	  };

    	  "custom/power" = {
    	  	format = "";
    	  	tooltip = false;
    	    on-double-click = "shutdown now";
    	  };

    	  "custom/reboot" = {
    	  	format = "󰜉";
    	  	tooltip = false;
    	  	on-double-click = "reboot";
    	  };

    	  "custom/logout" = {
    	  	format = "󰍃";
    	  	tooltip = false;
    	  	on-double-click = "hyprctl dispatch exit";
    	  };

        "custom/sep" = {
        	format = "|";
        	tooltip = false;
        };
      };
    };
    #	"hyprland/workspaces": {
    #		"format": "{icon}",
    #		"format-icons": {
    #			"1": "",
    #			"2": "",
    #			"3": "",
    #			"4": "",
    #			"5": "",
    #			// "default": "",
    #			// "active": "",
    #		},
    #		"persistent-workspaces": {
    #			"*": 5,
    #		}
    #	},
    #	"clock": {
    #		"interval": 1,
    #		"format": "{:%I:%M %p}",
    #		"format-alt": "{:%d/%m/%y %I:%M:%S %p}",
    #		"tooltip-format": "<tt><small>{calendar}</small></tt>",
    #		"calendar": {
    #            "mode"          : "month",
    #            "mode-mon-col"  : 3,
    #            "weeks-pos"     : "right",
    #            "on-scroll"     : 1,
    #            "format": {
    #				"months":     "<span color='#ffead3'><b>{}</b></span>",
    #                "days":       "<span color='#ecc6d9'><b>{}</b></span>",
    #                "weeks":      "",
    #                "weekdays":   "<span color='#ffcc66'><b>{}</b></span>",
    #                "today":      "<span color='#ff6699'><b><u>{}</u></b></span>"
    #            },
    #			"actions": {
    #				"on-click-right": "mode",
    #				"on-scroll-up": "shift_up",
    #				"on-scroll-down": "shift_down",
    #			},
    #        },
    #	},
    #	"tray": {
    #		"icon-size": 16,
    #		"spacing": 5,
    #	},
    #	"mpris": {
    #		// "interval": 1,
    #		"player-icons": {
    #			"firefox": "",
    #			"spotify": "",
    #		},
    #		"status-icons": {
    #			"playing": "▶",
    #			"paused": "⏸",
    #		},
    #		// "format": "{player_icon} {status_icon} {artist} - {title}",
    #		"format-playing": "<span font-family=\"Font Awesome 6 Free\">{player_icon} </span> {artist} - {title}",
    #		"format-paused": "<span font-family=\"Font Awesome 6 Free\">{status_icon} </span> {artist} - {title}",
    #		"format-stopped": "",
    #		"tooltip-format": "{dynamic}",
    #		"format-stopped": "",
    #		"dynamic-len": 50,
    #	},
    #	"wireplumber": {
    #		"format": "{icon}",
    #		"format-muted": "",
    #		"tooltip-format": "Volume: {volume}%",
    #		"on-click": "pavucontrol",
    #		"format-icons": ["", "", ""]
    #	},
    style = ''
      * {
          font-family: "Mononoki Nerd Font Mono", monospace;
          font-size: 16px;
          min-height: 0;
      }
      
      window#waybar {
      	all:unset;
      	background-color: rgba(0, 0, 0, 0);	
      	transition-property: background-color;
      	transition-duration: 0.5s;
      }
      
      button {
      	/* Use box-shadow instead of border so the text isn't offset */
      	box-shadow: inset 0 0 transparent;
      	color: #ffffff;
      	border: none;
      	border-radius: 0;
      }
      
      button:hover {
      	background: transparent;
      }
      
      tooltip {
      	background-color: rgba(12, 12, 12, 0.8);
      	border-radius: 0;
      }
      
      #workspaces,
      #clock,
      .modules-right {
      	background-color: rgba(24, 24, 24, 0.85);
        border: 2px solid;
        border-color: rgba(192, 147, 238, 0.85);
      	border-radius: 4;
      	padding: 0 0.5em;
      }
      
      #workspaces {
      	font-weight: bold;
      }
      
      #workspaces button {
      	padding: 0 0.25em;
      }
      
      #workspaces button.visible {
      	color: white;
      }
      
      #workspaces button.empty {
      	color: rgb(160, 160, 160);
      }
      
      #workspaces button.active {
      	background: transparent;
      	color: rgb(183, 121, 220);
      }

      .power-buttons {
      	padding: 0 0.5em;
      }
      
      #clock {
      	padding: 0 0.5em;
      	font-weight: bold;
        font-size: 18px;
      }
      
      #battery.charging { 
        color: green; 
      } 
      
      #battery.warning {
      	color: yellow;
      }
      
      #battery.critical {
      	color: red;
      }
    '';
  };
}
