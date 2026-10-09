
# Linux Backup Automation & Disaster Recovery

## Project Overview
A hands-on Linux administration project that automates backup creation, verification, scheduling, retention, and disaster recovery using Bash scripting on RHEL.

## Technologies Used
- Red Hat Enterprise Linux (RHEL)
- Bash scripting
- tar and gzip
- rsync
- cron / crond
- SHA-256 checksums
- Linux file permissions
- Git and GitHub

## Project Structure

```text
linux-backup-automation/
├── company-data/
│   ├── config/
│   └── reports/
├── scripts/
│   ├── backup.sh
│   └── cleanup.sh
├── backups/          # Excluded from Git
├── logs/             # Excluded from Git
├── .gitignore
└── README.md
```

## Features
1. Timestamped compressed backups using tar and gzip.
2. Source-directory validation before backup creation.
3. Backup integrity checks using gzip.
4. Success and failure logging.
5. Daily backup scheduling through cron.
6. Seven-day backup retention cleanup script.
7. File synchronization using rsync.
8. SHA-256 checksum verification.
9. File-level disaster recovery.
10. Controlled failure simulation and recovery.

## Run Backup

```bash
./scripts/backup.sh
```

## Run Cleanup

```bash
./scripts/cleanup.sh
```

## Schedule

The backup script is configured in the user's crontab:

```cron
0 2 * * * /home/akhilesh/linux-backup-automation/scripts/backup.sh
```

This runs daily at 2 AM when the RHEL server is running.

## Disaster Recovery Test

A sample application configuration file was intentionally deleted and restored from a verified tar.gz archive.

The restored file was compared with the archived version using `cmp`, returning exit status `0`.

## Failure Handling Test

The source directory was temporarily renamed to simulate missing application data.

The backup script detected the missing directory, logged an error, and returned exit status `1`.

After restoring the directory, the backup script executed successfully.

## Limitations and Future Improvements

- Backups are stored locally; production backups should also be kept off-server.
- Cron requires the server to be running.
- The retention script deletes matching archives older than seven days but does not guarantee a minimum number of recoverable backups.
- SHA-256 verification is currently performed manually.
- Monitoring alerts, automated restoration tests, and remote backup storage can be added later.

## Learning Outcome

This project demonstrates Linux administration, Bash automation, scheduled jobs, backup verification, troubleshooting, and disaster recovery fundamentals.
