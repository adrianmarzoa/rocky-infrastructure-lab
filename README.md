# Rocky Infraestructure Lab

A multi-node 3-tier platform on Linux on Rocky Linux 9, automation with Ansible and monitoring with Checkmk. Built to recreate real world system administration covering automation, security, monitoring and backups.

## Planned Architecture

- **web01**: Apache (reverse proxy) + Tomcat
- **db01**: MariaDB
- **mon01**: Checkmk, logs and backup
- **ctrl01**: Ansible control node (runs the playbooks)

Everything is provisioned with Vagrant and configured with Ansible.

## Status: work in progress
- [x] Project structure
- [] Virtual machines (Vagrant)
- [] Base hardening (SSH, firewalld, SELinux)
- [] Database, web and monitoring roles
- [] Backups, healk-check scripts and CI