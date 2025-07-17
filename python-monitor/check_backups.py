import os
import datetime

BACKUP_DIR = os.environ.get("BACKUP_DIR", "./shared")

def find_latest_backup():
    backups = [f for f in os.listdir(BACKUP_DIR) if f.endswith(".tar.gz")]
    if not backups:
        return {"status": "error", "message": "No backups found."}

    backups.sort(reverse=True)
    latest = backups[0]

    today = datetime.datetime.now().strftime("%Y-%m-%d")
    if today in latest:
        return {"status": "ok", "latest": latest}
    else:
        return {"status": "warning", "message": "No backup for today.", "latest": latest}

if __name__ == "__main__":
    print(find_latest_backup())
