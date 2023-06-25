extends Node

#files - .txt
var txtfile_user = str('userinfo.txt')
var txtfile_launchver = str('launch_ver.txt')

#projects - .exe
var exe_calculator = str('calculator.exe')
var exe_elfilauncher = str('elfilauncher.exe')
var exe_array = ['calculator', 'elfilauncher'] #for projects.gd

#folders (always end with '/')
var rootfolder = str('user://data/') #main folder for storing data
var projectfolder = str('user://data/application/') #main folder for projects

#external links
var github_link = str('https://github.com/Simply2D?tab=repositories')
var ext_calculator = str('https://github.com/Simply2D/GameLauncher/releases/download/v1.0.0.0/Launcher.exe')
var gith_elfilauncher = str('https://github.com/Elfiawesome/GameLauncher/releases/download/GameLauncher/Launcher.exe')

#data
var username = str('')
var latest_launchver = str('v1.1')
