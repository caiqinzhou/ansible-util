#!/bin/bash
set -eu

FACTS_DIR="facts"
TEMPLATE="export.j2"
OUTPUT=$1

if [ $# -gt 1 ]
then
    TEMPLATE=$2
fi

rm -rf $FACTS_DIR
mkdir -p $FACTS_DIR

echo "Get facts from machines..."
ansible -i hosts all -m setup --tree $FACTS_DIR 1>/dev/null

echo "Export facts..."
python export_facts.py -f $FACTS_DIR -t $TEMPLATE -o $OUTPUT

echo "Done"
