# Invidious Home-Asssitant Add-On
All credits to [Invidious team](https://invidious.io/)

## How-to install
### Using HA add-on store
>From Settings > Add-ons open the add-on store.
>Add the URL of the repository and then press "Add". A new card for the repository will appear.

[Source](https://www.home-assistant.io/addons/](https://www.home-assistant.io/common-tasks/os#installing-third-party-add-ons)https://www.home-assistant.io/common-tasks/os#installing-third-party-add-ons)

### Using local addons folder (dev method)
> To get started with developing add-ons, we first need access to where Home Assistant looks for local add-ons. For this you can use the Samba or the SSH add-ons.
> For Samba, once you have enabled and started it, your Home Assistant instance will show up in your local network tab and share a folder called "addons". This is the folder to store your custom add-ons.
> For SSH, you will have to install it. Before you can start it, you will have to have a private/public key pair and store your public key in the add-on config (see docs for more info). Once started, you can SSH to Home Assistant and store your custom add-ons in the /addons directory.

[Source](https://developers.home-assistant.io/docs/add-ons/tutorial)

Clone this repo
```
git clone https://github.com/yo1frenchtoast/invidous-ha.git
```
And push created `invidious` folder to `/addons` location

## TODO
- handle invidious options (/invidious/config/config.yml) in add-on configuration
- data persistence
