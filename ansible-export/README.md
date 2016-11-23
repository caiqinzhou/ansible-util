# Instruction

Export infomation from ansible facts.

# Requirement

```
sudo pip install jinja2
```

# Usage:

```shell
sh export_facts.sh <Output file> [template]

# eg.:
sh export_facts.sh hosts.csv
sh export_facts.sh hosts.csv export.j2

```

