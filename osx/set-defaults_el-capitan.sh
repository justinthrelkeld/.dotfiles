# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.

echo "setting OSX defaults, just how you like them"

# /////////////////////////////////////////////////
# Keyboard and mouse
# /////////////////////////////////////////////////

defaults write -g ApplePressAndHoldEnabled -bool true

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Set the key repeat speed.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 35

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Right clicking is a thing
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton


# /////////////////////////////////////////////////
# Screenshots
# /////////////////////////////////////////////////

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# /////////////////////////////////////////////////
# Spaces, Hot Corners, displays
# /////////////////////////////////////////////////

# Don't rearrange Spaces based on Most Recently Used (mru)
defaults write com.apple.dock mru-spaces -bool false

# Hide the dashboard because who even uses it?
# turn it on with `defaults write com.apple.dashboard mcx-disabled -boolean YES`
defaults write com.apple.dock dashboard-in-overlay -bool true

# Hot corners
# 	1 Nothing
# 	2 All Windows
# 	3 Application windows
# 	4 Desktop
# 	5 Start Screen Saver
# 	6 Disable Screen Saver
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0

defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

defaults write com.apple.dock wvous-br-corner -int 2
defaults write com.apple.dock wvous-br-modifier -int 0

defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Make Fliqlo the screensaver (assuming it was installed with homebrew/install)
defaults -currentHost write com.apple.screensaver modulePath -string $HOME"/Library/Screen Savers/Fliqlo.saver"
defaults -currentHost write com.apple.screensaver moduleName -string "Fliqlo"


# /////////////////////////////////////////////////
# Finder, Quicklook, Dock, Spotlight
# /////////////////////////////////////////////////

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Enable AirDrop over Ethernet and on unsupported Macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Enable text copying from Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool YES

# Set the icon size of Dock items to 50 pixels
defaults write com.apple.dock tilesize -int 50

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Clean and organize the dock (assumes dockutil from homebrew/install)
dockutil \ 
--remove Maps \ 
--remove FaceTime \ 
--remove iBooks \ 
--remove iTunes \ 
--remove Reminders \ 
--remove Contacts \ 
--remove Photos \ 
--remove "Feedback Assistant" \ 
--move "System Preferences" --position 2


# /////////////////////////////////////////////////
# Safari and other apps
# /////////////////////////////////////////////////

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1


echo "killing Dock so it loads in your new settings"
killall Dock

echo "your mac is now sane :)"
