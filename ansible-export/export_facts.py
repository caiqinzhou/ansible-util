#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import json
import argparse
import jinja2

def export_facts(facts_dir, out_template, out_file):
    print "Template: " + out_template
    print "Output: " + out_file
    hosts = os.listdir(facts_dir)
    hosts_model = {"hosts":[]}
    for host in hosts:
        host_file = file(facts_dir + os.sep + host)
        host_json = json.load(host_file)
        hosts_model["hosts"].append(host_json)
    print "Total Hosts: " + str(len(hosts))
    template = jinja2.Environment(loader=jinja2.FileSystemLoader('.')).get_template(out_template)
    result = template.render(hosts_model)
    output_file = open(out_file, "w")
    output_file.write(result)
    output_file.close()

if __name__ == '__main__':
    # 命令参数解析
    parser = argparse.ArgumentParser()
    parser.add_argument("-f", action='store', dest='facts_dir', help='Facts directory.', default="facts")
    parser.add_argument("-t", action='store', dest='out_template', help='Output template.')
    parser.add_argument("-o", action='store', dest='out_file', help='Output file.')
    cmdArgs = parser.parse_args()
    export_facts(cmdArgs.facts_dir, cmdArgs.out_template, cmdArgs.out_file)
