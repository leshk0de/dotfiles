## Remove the annoying Ubuntu welcome message
## https://neilzone.co.uk/2022/12/unwanted-spam-on-ubuntu-ssh-login-and-how-to-stop-it/
#
#  * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
#  just raised the bar for easy, resilient and secure K8s cluster deployment.
#
#   https://ubuntu.com/engage/secure-kubernetes-at-the-edge
#

```sh
sudo rm /etc/update-motd.d/50-motd-news
```

# Introducing Expanded Security Maintenance for Applications. 
# Receive updates to over 25,000 software packages with your Ubuntu Pro subscription. Free for personal use.
#
# https://ubuntu.com/pro
```sh
sudo rm /etc/update-motd.d/88-esm-announce
sudo rm /etc/update-motd.d/91-contract-ua-esm-status
```

#
```sh
sudo sed -Ezi.orig \
  -e 's/(def _output_esm_service_status.outstream, have_esm_service, service_type.:\n)/\1    return\n/' \
  -e 's/(def _output_esm_package_alert.*?\n.*?\n.:\n)/\1    return\n/' \
  /usr/lib/update-notifier/apt_check.py

mkdir -p relocated_apt
sudo mv /etc/apt/apt.conf.d/20apt-esm-hook.conf ~/relocated_apt/.

```
  

# Other
```sh
sudo rm /etc/update-motd.d/10-help-text
```

