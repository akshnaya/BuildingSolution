#!/usr/bin/env python3
"""
           NAME: example-app
         AUTHOR: Akshata Nayak
    DESCRIPTION: This example app is responsible for maintaining json object
                 passed in a list

"""

import connexion
import gevent
from http import HTTPStatus
import Exception

app_list = []

def login():
    with open(/example-app-secret/username) as key_file:
        username = key_file.read().strip()
    if username is not "Akshata":
        raise Exception("Incorrect username")

def getappdetails():
    """
        Get app details
        Status:
            200 - details retrieved
            500 - failure
    """
    login() 
    return (app_list, HTTPStatus.OK)

def postappdetails(param):
    """
        Add app details

        Status:
            200 - build retrieved
            500 - failure
    """
    login()
    app_list.append(param)
    return (app_list, HTTPStatus.OK)

if __name__ == '__main__':
    """
    Starts the front end of the API which is responsible for handling
    incoming requests
    """
    APP = connexion.App('Example-App', specification_dir='/etc', debug=True)
    APP.add_api('swagger.yaml')
    kwargs = {'server': 'gevent',
              'port': 8080}

    # run our standalone gevent server
    APP.run(**kwargs)
