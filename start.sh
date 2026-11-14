#!/bin/bash

./sys_info_page.sh > sys_info_page.html
google-chrome ./sys_info_page.html
