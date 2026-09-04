import os
import sqlite3
import time

SQL_QUERY = """
SELECT m.type,
       m.origin,
       m.permission,
       m.expireType,
       m.expireTime,
       m.modificationTime
  FROM moz_perms m
 WHERE m.type not in ('storageAccessAPI', 'WebExtensions-unlimitedStorage', 'persistent-storage', 'highValueCOOP')
   AND m.type not like '3rdPartyStorage^%'
 ORDER BY m.type,
          m.origin;
"""


def add_path(list: list[str], path: str):
    normed = os.path.normpath(os.path.expandvars(path))
    if os.path.isdir(normed):
        list.append(normed)


def get_file_list(profiles_path: str) -> list[str]:
    result: list[str] = []

    for profile_name in os.listdir(profiles_path):
        file_path = os.path.join(profiles_path, profile_name, "permissions.sqlite")
        if os.path.isfile(file_path):
            result.append(file_path)

    return result


def timstamp_to_date(timestamp: int) -> str:
    format = "%Y-%m-%d %H:%M:%S"

    if timestamp == 0:
        return "N/A"
    else:
        return time.strftime(format, time.gmtime(timestamp / 1000))


def list_permissions(db_path: str) -> list[list[str]]:
    result: list[list[str]] = []

    con = sqlite3.connect(db_path)
    cur = con.cursor()

    for row in cur.execute(SQL_QUERY):
        row_type = row[0]
        row_origin = row[1]
        row_permission = row[2]
        row_expireType = row[3]
        row_expireTime = timstamp_to_date(row[4])
        row_modTime = timstamp_to_date(row[5])

        result.append(
            [
                row_type,
                row_origin,
                row_permission,
                row_expireType,
                row_expireTime,
                row_modTime,
            ]
        )

    cur.close()
    con.close()

    return result


def print_permissions(permissions: list[list[str]]):
    max_width = 6  # length of 'origin'
    prev_type = ""

    for perm in permissions:
        max_width = max(max_width, len(perm[1]))

    print(
        f"    {'origin'.ljust(max_width)}  permission  expireType  expireTime           modificationTime"
    )

    for perm in permissions:
        if prev_type != perm[0]:
            prev_type = perm[0]
            print(perm[0])

        print(
            f"    {perm[1].ljust(max_width)}  {perm[2]}           {perm[3]}           "
            f"{perm[4].ljust(19)}  {perm[5].ljust(19)}"
        )


path_list: list[str] = []
add_path(path_list, "%AppData%/Mozilla/Firefox/Profiles/")
add_path(path_list, "%AppData%/zen/Profiles/")

db_list: list[str] = []
for path in path_list:
    db_list += get_file_list(path)

for index, db_path in enumerate(db_list):
    if index != 0:
        print(f"\n{'-' * 80}")
    print(f"\n{db_path}\n")
    perm = list_permissions(db_path)
    print_permissions(perm)
