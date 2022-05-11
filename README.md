## Dynamic SSL Updater

### Operational Overview
1. ACME cronjob is working on raptor.bustraan.net and it can renew free wildcard SSL certificate ever 90 day from zerossl.com or letsencrypt.com
  status: DONE

2. Create and Ansible playbook to:
  - Download latest SSL certificates from Raptor host as cronjob - DONE
  - Copy certs by OS-type and installed package type (nginx, httpd, pveproxy, cockpit) to correct directory and filename formats. DONE
  - Restart appropriate processes
  status: DONE

### Monitoring
* Added BASH script to Zabbix to check for days remaining.  It runs once daily and will alert when there are only 10 days remaining on the certificate (certificate life is 90 days)
---
### Sample Zabbix Screens
#### Problem Detected in Zabbix:
![Problem Detected](images/ssl_problem.jpeg)
#### Latest Data
![Latest Data](images/ssl_items.jpeg)
#### Setup a new Item
![Setup Item](images/ssl_single_item_setup.jpeg)
#### Setup a new Trigger
![Setup Trigger](images/ssl_single_trigger_setup.jpeg)

### Additional ToDo:
* Prometheus and Grafana hosts should be added to "sslcerts" group - add nginx reverse proxy in front of service port - DONE
* Add Proxmox cluster UI and API certificates to scripts - workflow is documented.
