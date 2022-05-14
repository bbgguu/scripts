# _*_ coding: utf-8 _*_
#
# Query IP geolocations by ip-api.com API.

import requests

def get_ip_geolocations(ip):
    url = 'http://ip-api.com/json/' + ip
    r = requests.get(url)
    d = r.json()

    if d['status'] == 'success':
        geo = d['city'] + ', ' + d['regionName'] + ', ' + d['country']
    else:
        geo = 'query failed'

    return geo

ip = input("Please input an IP: ")
geo = get_ip_geolocations(ip)

print(f"Location: {geo}")
